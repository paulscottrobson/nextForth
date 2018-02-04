#
# Automatically generated
#
class CoreInformation(object):
	def getSystemBaseAddress(self):
		return 0x6000
	def getMainRoutineVector(self):
		return 0x6003
	def getDictionaryNextFreePointer(self):
		return 0x6007
	def getCodeNextFreePointer(self):
		return 0x6009
	def getWorkspaceAddress(self):
		return 0x600c
	def getDictionaryTableBase(self):
		return 0x6014
	def createDictionaryItems(self,dict):
		dict.addCallWord("!",0x8182)
		dict.addCallWord("*",0x818c)
		dict.addCallWord("+",0x81a5)
		dict.addCallWord("+!",0x81ac)
		dict.addCallWord("-",0x81b9)
		dict.addCallWord("0<",0x81c2)
		dict.addCallWord("0=",0x81cc)
		dict.addCallWord("1+",0x81d6)
		dict.addCallWord("1-",0x81d8)
		dict.addCallWord("2*",0x81da)
		dict.addCallWord("2+",0x81de)
		dict.addCallWord("2-",0x81e1)
		dict.addCallWord("2/",0x81e4)
		dict.addCallWord("2drop",0x81e9)
		dict.addCallWord("2dup",0x81ed)
		dict.addCallWord("<",0x81f5)
		dict.addCallWord("=",0x8205)
		dict.addCallWord(">",0x8215)
		dict.addCallWord("?dup",0x8226)
		dict.addCallWord("@",0x822f)
		dict.addCallWord("[expand.macro]",0x8234)
		dict.addCallWord("abs",0x8236)
		dict.addCallWord("and",0x8244)
		dict.addCallWord("c!",0x824d)
		dict.addCallWord("c@",0x8255)
		dict.addCallWord("clear.screen",0x825a)
		dict.addCallWord("colour!",0x825f)
		dict.addCallWord("cursor!",0x8266)
		dict.addCallWord("debug",0x826f)
		dict.addCallWord("drop",0x8272)
		dict.addCallWord("dump.stack",0x8275)
		dict.addCallWord("dup",0x827e)
		dict.addCallWord("fill",0x8281)
		dict.addCallWord("halt",0x8291)
		dict.addCallWord("keyboard@",0x8294)
		dict.addCallWord("move",0x829d)
		dict.addCallWord("negate",0x82af)
		dict.addCallWord("nip",0x82b9)
		dict.addCallWord("not",0x82bc)
		dict.addCallWord("or",0x82c6)
		dict.addCallWord("over",0x82cf)
		dict.addCallWord("rot",0x82d7)
		dict.addCallWord("screen!",0x82e0)
		dict.addCallWord("swap",0x82eb)
		dict.addCallWord("u<",0x82f2)
		dict.addCallWord("xor",0x8300)
		dict.addMacroWord("!",0x8184,0x818a)
		dict.addMacroWord("+",0x81a7,0x81aa)
		dict.addMacroWord("-",0x81bb,0x81c0)
		dict.addMacroWord("0<",0x81c3,0x81cb)
		dict.addMacroWord("0=",0x81cd,0x81d5)
		dict.addMacroWord("1+",0x81d6,0x81d7)
		dict.addMacroWord("1-",0x81d8,0x81d9)
		dict.addMacroWord("2*",0x81da,0x81dd)
		dict.addMacroWord("2+",0x81de,0x81e0)
		dict.addMacroWord("2-",0x81e1,0x81e3)
		dict.addMacroWord("2/",0x81e4,0x81e8)
		dict.addMacroWord("2drop",0x81ea,0x81ec)
		dict.addMacroWord("2dup",0x81ef,0x81f3)
		dict.addMacroWord("?dup",0x8228,0x822d)
		dict.addMacroWord("@",0x822f,0x8233)
		dict.addMacroWord("and",0x8245,0x824c)
		dict.addMacroWord("c!",0x824f,0x8253)
		dict.addMacroWord("c@",0x8255,0x8259)
		dict.addMacroWord("clear.screen",0x825b,0x825e)
		dict.addMacroWord("debug",0x826f,0x8271)
		dict.addMacroWord("drop",0x8273,0x8274)
		dict.addMacroWord("dup",0x827f,0x8280)
		dict.addMacroWord("negate",0x82b1,0x82b7)
		dict.addMacroWord("nip",0x82ba,0x82bb)
		dict.addMacroWord("or",0x82c7,0x82ce)
		dict.addMacroWord("over",0x82d1,0x82d5)
		dict.addMacroWord("rot",0x82d9,0x82de)
		dict.addMacroWord("swap",0x82ed,0x82f0)
		dict.addMacroWord("xor",0x8301,0x8308)
