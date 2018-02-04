# **********************************************************************************************************
#
#		Name:		dictionary.py
#		Purpose:	Memory storage
#		Author:		Paul Robson (paul@robsons.org.uk)
#		Date:		2nd February 2018
#
# **********************************************************************************************************

from exception import *
from coreinfo import *
from memory import *
import sys

# **********************************************************************************************************
#	
#										Dictionary Item classes
#	
# **********************************************************************************************************

class DictionaryItem(object):
	def __init__(self,name,address,dictionaryID):
		self.name = name.strip().upper()
		self.address = address
		self.private = False
		self.dictionaryID = dictionaryID
	#
	def getAddress(self):
		return self.address
	#
	#	1 = Forth, 2 = Compiler
	#
	def getDictionaryID(self):
		return self.dictionaryID
	#
	def getName(self):
		return self.name
	#
	def isPrivate(self):
		return self.private 
	#
	def isMacro(self):
		return False
	#
	def makePrivate(self):
		self.private = True

DictionaryItem.FORTH = 1
DictionaryItem.COMPILER = 2

class DictionaryMacro(DictionaryItem):
	def isMacro(self):
		return True 

# **********************************************************************************************************
#
#												Dictionary
#
# **********************************************************************************************************

class Dictionary(object):
	def __init__(self,memory):
		self.memory = memory
		# all entries, calls AND macros
		self.entries = []
		# functioning entries. We add macros after calls so calls supercede macros here.
		self.nameToEntry = {}
		self.nameToMacro = {}
		self.info = CoreInformation()
		self.info.createDictionaryItems(self)
		#print(self.nameToEntry.keys())
	#
	def add(self,dictionaryItem):
		self.entries.append(dictionaryItem)
		if dictionaryItem.getDictionaryID() == DictionaryItem.FORTH:
			self.nameToEntry[dictionaryItem.getName()] = dictionaryItem
		else:
			self.nameToMacro[dictionaryItem.getName()] = dictionaryItem
	#
	def addCallWord(self,name,address):
		self.add(DictionaryItem(name,address,DictionaryItem.FORTH))
	#
	def addMacroWord(self,name,macroCodeStart,macroCodeEnd):
		self.add(DictionaryMacro(name,self.memory.getPointer(),DictionaryItem.COMPILER))
		self.memory.compileByte(0x21) 					# LD HL,<macrocode>
		self.memory.compileWord(macroCodeStart)
		self.memory.compileByte(0x06)					# LD B,<count>
		self.memory.compileByte(macroCodeEnd-macroCodeStart)
		self.memory.compileByte(0xC3) 					# JP [expand.macro]
		self.memory.compileWord(self.find("[expand.macro]").getAddress())
	#
	def find(self,name):
		name = name.strip().upper()
		return None if name not in self.nameToEntry else self.nameToEntry[name]
	#
	def last(self):
		return self.entries[-1]
	#
	def list(self,target = sys.stdout):
		for e in self.entries:
			s = "${0:04x} D:{4} {1:16} {2}{3}\n".format(e.getAddress(),e.getName().lower(), \
					"private " if e.isPrivate() else "","macro " if e.isMacro() else "", \
					e.getDictionaryID())
			target.write(s)
	#
	def render(self):
		pass

if __name__ == '__main__':
	m = Memory()
	d = Dictionary(m)
	d.list()
	d.render()
