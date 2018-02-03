# **********************************************************************************************************
#
#		Name:		fcc.py
#		Purpose:	Compiler
#		Author:		Paul Robson (paul@robsons.org.uk)
#		Date:		2nd February 2018
#
# **********************************************************************************************************

from exception import *
from coreinfo import *
from memory import *
from dictionary import *
import re,sys

# **********************************************************************************************************
#	
#												Compiler class
#	
# **********************************************************************************************************

class Compiler(object):
	#
	#	Initialise the compilation
	#
	def __init__(self):
		self.info = CoreInformation()
		self.memory = Memory()
		self.dictionary = Dictionary(self.memory)
		#
		self.lineNumber = 0
		self.fileName = None
		self.compileEnabled = True
		self.currentWordStart = None
		self.ifLink = None
		self.forLink = None
		self.beginLink = None
	#
	#	End compilation
	#
	def complete(self):
		# create dictionary in memory
		self.dictionary.render()
		# write out the binary file.
		print('Writing "forth.bin".')
		self.memory.writeBinary("forth.bin")

	#
	#	Compile a file
	#
	def compileFile(self,fileName):
		self.fileName = fileName
		print('Compiling "{0}".'.format(fileName))
		self.compileText(open(fileName).readlines())
	#
	#	Compile an array of text lines.
	#
	def compileText(self,strArray):
		#self.memory.echo = True
		for i in range(0,len(strArray)):
			self.lineNumber = i + 1
			line = strArray[i].replace("\t"," ").replace("\n","").strip()
			while line.find("(") >= 0:
				line = self.removeComment(line)
			line = line.lower().strip().split(" ")
			for word in [x for x in line if x != ""]:
				self.compileWord(word)
		#self.memory.echo = False
	#
	#	Remove a comment
	#
	def removeComment(self,line):
		p = line.find("(")
		assert p >= 0
		q = line[p:].find(")")
		if q < 0:
			raise CompilerException("Closing ) missing in comment")
		return line[:p]+line[p+q+1:]
	#
	#	Compile a single word.
	#
	def compileWord(self,word):
		# Check for :<name>
		if word[0] == ':' and len(word) > 1:
			self.compileWordHeader(word)
			return
		# Compiler not enabled.
		if not self.compileEnabled:
			return
		# Check for ; returns.
		if word == ';':
			self.compileWordReturn()
			return
		# Try as a word
		if self.dictionary.find(word) is not None:
			self.compileCall(word)
			return
		# Try as literal
		if re.match("^\-?\d+$",word) is not None:
			self.compileLiteral(int(word,10))
			return
		if re.match("^\$[0-9a-f]+$",word) is not None:
			self.compileLiteral(int(word[1:],16))
			return

		raise CompilerException("Cannot process '{0}'".format(word))
	#
	#	Compile standard header for a new word.
	#
	def compileWordHeader(self,word):
		# check not already in definition
		if self.currentWordStart is not None:
			raise CompilerException("Word not closed when defining "+word)
		self.currentWordStart = self.memory.getPointer()
		# add directory record.
		word = word[1:].lower()
		dItem = DictionaryItem(word,self.memory.getPointer(),1)
		self.dictionary.add(dItem)
		# Compile POP HL ; LD (addr),HL
		self.memory.compileByte(0xE1)						# POP HL
		self.memory.compileByte(0x22) 						# LD (nnnn),HL
		self.memory.compileWord(0x0000)						# fixed up later on.
		# if _main patch vector
		if word == "__main":
			self.memory.writeWord(self.info.getMainRoutineVector(),self.memory.getPointer(),True)
	#
	#	Compile a return.  If the word has already ended, compile a jump to that end.
	#	we can have multiple exit points.
	#
	#	Because of the single stack we cannot recurse except using 'self'.
	#
	def compileWordReturn(self):
		# check in word
		if self.currentWordStart is None:
			raise CompilerException("Not in a definition")
		# update the ld (xxx),hl address
		self.memory.writeWord(self.currentWordStart+2,self.memory.getPointer()+1,True)
		# write out JP $0
		self.memory.compileByte(0xC3) 						# JP
		self.memory.compileWord(0x0000)						# $0000
		self.currentWordStart = None
	#
	#	Compile a call for a non-macro word
	#
	def compileCall(self,word):
		dAddr = self.dictionary.find(word).getAddress()
		if dAddr == self.currentWordStart:
			raise CompilerException("Recursion not permitted")
		self.memory.compileByte(0xCD)						# CALL
		self.memory.compileWord(dAddr)						# <somewhere>
	#
	#	Compile code to push a literal on the stack
	#
	def compileLiteral(self,value):
		self.memory.compileByte(0xD5)						# PUSH DE
		self.memory.compileByte(0x11)						# LD DE,nnnn
		self.memory.compileWord(value & 0xFFFF)
	#
	#	Compile code to 'execute' a macro 
	#
	def executeMacro(self,word):
		pass
	#
	#	Compile if/-if/then code
	#
	def compileConditional(self,word):
		pass
	#
	#	Compile begin/until/-until
	#
	def compileBeginLoop(self,word):
		pass
	#
	#	Compile for/next. Similar trick to that avoiding Return.
	#
	def compileForLoop(self,word):
		pass

if __name__ == '__main__':
	cc = Compiler()
	cc.compileFile("testing.forth")
	#cc.dictionary.list()
	cc.complete()	

# TODO:
# 	testing
#	structores/conditionals.
# 	rendering directories
# 	i/o words
#	add min max / mod times within (?)
# 	macro expansion / speed control

