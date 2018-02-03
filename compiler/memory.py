# **********************************************************************************************************
#
#		Name:		memory.py
#		Purpose:	Memory storage
#		Author:		Paul Robson (paul@robsons.org.uk)
#		Date:		2nd February 2018
#
# **********************************************************************************************************

from exception import *
from coreinfo import *

# **********************************************************************************************************
#	
#										Memory object
#
# **********************************************************************************************************

class Memory:
	#
	#	Initialise.
	#
	def __init__(self):
		self.memory = [None] * 0x10000	
		self.echo = False
		# Load core vocabulary in.
		self.info = CoreInformation()
		self.loadCoreBinary(self.info.getSystemBaseAddress(),"core.bin")
		#
		self.pointer = self.readWord(self.info.getCodeNextFreePointer())
		self.highest = self.pointer
		#
		self.echo = False
	#
	#	load in the Binary Core
	#
	def loadCoreBinary(self,address,fileName):
		coreBytes = open(fileName,"rb").read(-1)
		for i in range(0,len(coreBytes)):
			self.memory[self.info.getSystemBaseAddress()+i] = coreBytes[i]
		return len(coreBytes)
	#
	#	Write a byte direct
	#
	def writeByte(self,address,byte,overWrite = False):
		if address < 0x0000 or address > 0xFFFF or byte < 0 or byte > 0xFF:
			raise CompilerException("Bad memory write {0:04x} <- {1:02x}".format(address,byte))
		if self.memory[address] is not None:
			if not overWrite:
				raise CompilerException("Memory overwritten {0:04x}".format(address))
		self.memory[address] = byte
		self.highest = max(self.highest,address)
		if self.echo:
			ch = ((byte & 0x3F)^32) + 32
			ch = ch if (ch < ord('A') or ch > ord('Z')) else ch + 32
			print("{0:04x} : {1:02x} '{2:c}'".format(address,byte,ch))
	#
	#	Write a word 
	#
	def writeWord(self,address,word,overWrite = False):
		self.writeByte(address,word & 0xFF,overWrite)
		self.writeByte(address+1,word >> 8,overWrite)
	#
	#	Read a byte
	#
	def readByte(self,address):
		assert self.memory[address] is not None
		return self.memory[address]
	#
	#	Read a word
	#
	def readWord(self,address):
		return self.readByte(address)+self.readByte(address+1)*256
	#
	#	get compile pointer
	#
	def getPointer(self):
		return self.pointer
	#
	#	compile a byte
	#
	def compileByte(self,byte):
		self.writeByte(self.pointer,byte)
		self.pointer += 1
	#
	#	compile a word
	#
	def compileWord(self,word):
		self.writeWord(self.pointer,word)
		self.pointer += 2
	#
	#	Write to file
	#
	def writeBinary(self,fileName):
		print("Code rendered ${0:04x}-${1:04x}".format(self.info.getSystemBaseAddress(),self.pointer))
		# next free byte in code space
		self.writeWord(self.info.getCodeNextFreePointer(),self.pointer,True)
		# write out binary blob
		loadAddress = self.info.getSystemBaseAddress()
		bin = [x if x is not None else 0 for x in self.memory[loadAddress:self.highest+2]]
		#bin = "".join([chr(x) for x in bin])
		open(fileName,"wb").write(bytes(bin))

if __name__ == '__main__':
	m = Memory()
	m.writeBinary("forth.bin")
