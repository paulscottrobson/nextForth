#
# Automatically generated
#
class CoreInformation(object):
	def getgetSystemBaseAddress(self):
		return 0x6000
	def getgetMainRoutineVector(self):
		return 0x6003
	def getgetDictionaryNextFreePointer(self):
		return 0x6007
	def getgetCodeNextFreePointer(self):
		return 0x6009
	def getgetWorkspaceAddress(self):
		return 0x600c
	def getgetDictionaryTableBase(self):
		return 0x6014
	def createDictionaryItems(self,dict):
		dict.addCallWord("0<",0x8182)
		dict.addMacroWord("0<",0x8182,0x818c)
		dict.addCallWord("0=",0x818c)
		dict.addMacroWord("0=",0x818c,0x8196)
		dict.addCallWord("1+",0x8196)
		dict.addMacroWord("1+",0x8196,0x8198)
		dict.addCallWord("1-",0x8198)
		dict.addMacroWord("1-",0x8198,0x819a)
		dict.addCallWord("2+",0x819a)
		dict.addMacroWord("2+",0x819a,0x819d)
		dict.addCallWord("2-",0x819d)
		dict.addMacroWord("2-",0x819d,0x81a0)
		dict.addCallWord("and",0x81a0)
		dict.addMacroWord("and",0x81a0,0x81a9)
		dict.addCallWord("drop",0x81a9)
		dict.addMacroWord("drop",0x81a9,0x81ac)
		dict.addCallWord("dup",0x81ac)
		dict.addMacroWord("dup",0x81ac,0x81af)
		dict.addCallWord("halt",0x81af)
		dict.addCallWord("not",0x81b2)
		dict.addMacroWord("not",0x81b2,0x81ba)
		dict.addCallWord("or",0x81ba)
		dict.addMacroWord("or",0x81ba,0x81c3)
		dict.addCallWord("over",0x81c3)
		dict.addMacroWord("over",0x81c3,0x81cb)
		dict.addCallWord("swap",0x81cb)
		dict.addMacroWord("swap",0x81cb,0x81d2)
		dict.addCallWord("xor",0x81d2)
		dict.addMacroWord("xor",0x81d2,0x81db)
