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
		dict.addCallWord("2dup",0x81ef)
		dict.addCallWord("<",0x81f7)
		dict.addCallWord("=",0x8207)
		dict.addCallWord(">",0x8217)
		dict.addCallWord("?dup",0x8228)
		dict.addCallWord("@",0x8231)
		dict.addCallWord("[expand.macro]",0x8236)
		dict.addCallWord("abs",0x8238)
		dict.addCallWord("and",0x8246)
		dict.addCallWord("c!",0x824f)
		dict.addCallWord("c@",0x8257)
		dict.addCallWord("debug",0x825c)
		dict.addCallWord("drop",0x825f)
		dict.addCallWord("dump.stack",0x8262)
		dict.addCallWord("dup",0x826b)
		dict.addCallWord("fill",0x826e)
		dict.addCallWord("halt",0x827e)
		dict.addCallWord("move",0x8281)
		dict.addCallWord("negate",0x8293)
		dict.addCallWord("nip",0x829d)
		dict.addCallWord("not",0x82a0)
		dict.addCallWord("or",0x82aa)
		dict.addCallWord("over",0x82b3)
		dict.addCallWord("rot",0x82bb)
		dict.addCallWord("swap",0x82c4)
		dict.addCallWord("u<",0x82cb)
		dict.addCallWord("xor",0x82d9)
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
		dict.addMacroWord("2drop",0x81ea,0x81ee)
		dict.addMacroWord("2dup",0x81f1,0x81f5)
		dict.addMacroWord("?dup",0x822a,0x822f)
		dict.addMacroWord("@",0x8231,0x8235)
		dict.addMacroWord("and",0x8247,0x824e)
		dict.addMacroWord("c!",0x8251,0x8255)
		dict.addMacroWord("c@",0x8257,0x825b)
		dict.addMacroWord("debug",0x825c,0x825e)
		dict.addMacroWord("drop",0x8260,0x8261)
		dict.addMacroWord("dup",0x826c,0x826d)
		dict.addMacroWord("negate",0x8295,0x829b)
		dict.addMacroWord("nip",0x829e,0x829f)
		dict.addMacroWord("or",0x82ab,0x82b2)
		dict.addMacroWord("over",0x82b5,0x82b9)
		dict.addMacroWord("rot",0x82bd,0x82c2)
		dict.addMacroWord("swap",0x82c6,0x82c9)
		dict.addMacroWord("xor",0x82da,0x82e1)
