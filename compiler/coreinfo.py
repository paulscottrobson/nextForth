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
		dict.addCallWord("!",0x8182)
		dict.addMacroWord("!",0x8182,0x818c)
		dict.addCallWord("*",0x818c)
		dict.addCallWord("+",0x81a5)
		dict.addMacroWord("+",0x81a5,0x81ac)
		dict.addCallWord("+!",0x81ac)
		dict.addCallWord("-",0x81b9)
		dict.addMacroWord("-",0x81b9,0x81c2)
		dict.addCallWord("0<",0x81c2)
		dict.addMacroWord("0<",0x81c2,0x81cc)
		dict.addCallWord("0=",0x81cc)
		dict.addMacroWord("0=",0x81cc,0x81d6)
		dict.addCallWord("1+",0x81d6)
		dict.addMacroWord("1+",0x81d6,0x81d8)
		dict.addCallWord("1-",0x81d8)
		dict.addMacroWord("1-",0x81d8,0x81da)
		dict.addCallWord("2*",0x81da)
		dict.addMacroWord("2*",0x81da,0x81de)
		dict.addCallWord("2+",0x81de)
		dict.addMacroWord("2+",0x81de,0x81e1)
		dict.addCallWord("2-",0x81e1)
		dict.addMacroWord("2-",0x81e1,0x81e4)
		dict.addCallWord("2/",0x81e4)
		dict.addMacroWord("2/",0x81e4,0x81e9)
		dict.addCallWord("2drop",0x81e9)
		dict.addMacroWord("2drop",0x81e9,0x81ef)
		dict.addCallWord("2dup",0x81ef)
		dict.addMacroWord("2dup",0x81ef,0x81f7)
		dict.addCallWord("<",0x81f7)
		dict.addCallWord("=",0x8207)
		dict.addCallWord(">",0x8217)
		dict.addCallWord("?dup",0x8228)
		dict.addMacroWord("?dup",0x8228,0x8231)
		dict.addCallWord("@",0x8231)
		dict.addMacroWord("@",0x8231,0x8236)
		dict.addCallWord("abs",0x8236)
		dict.addCallWord("and",0x8244)
		dict.addMacroWord("and",0x8244,0x824d)
		dict.addCallWord("c!",0x824d)
		dict.addMacroWord("c!",0x824d,0x8255)
		dict.addCallWord("c@",0x8255)
		dict.addMacroWord("c@",0x8255,0x825a)
		dict.addCallWord("debug",0x825a)
		dict.addMacroWord("debug",0x825a,0x825d)
		dict.addCallWord("drop",0x825d)
		dict.addMacroWord("drop",0x825d,0x8260)
		dict.addCallWord("dump.stack",0x8260)
		dict.addCallWord("dup",0x8269)
		dict.addMacroWord("dup",0x8269,0x826c)
		dict.addCallWord("fill",0x826c)
		dict.addCallWord("halt",0x827c)
		dict.addCallWord("move",0x827f)
		dict.addCallWord("negate",0x8291)
		dict.addMacroWord("negate",0x8291,0x829b)
		dict.addCallWord("nip",0x829b)
		dict.addMacroWord("nip",0x829b,0x829e)
		dict.addCallWord("not",0x829e)
		dict.addCallWord("or",0x82a8)
		dict.addMacroWord("or",0x82a8,0x82b1)
		dict.addCallWord("over",0x82b1)
		dict.addMacroWord("over",0x82b1,0x82b9)
		dict.addCallWord("rot",0x82b9)
		dict.addMacroWord("rot",0x82b9,0x82c2)
		dict.addCallWord("swap",0x82c2)
		dict.addMacroWord("swap",0x82c2,0x82c9)
		dict.addCallWord("u<",0x82c9)
		dict.addCallWord("xor",0x82d7)
		dict.addMacroWord("xor",0x82d7,0x82e0)
