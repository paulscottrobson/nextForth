#
# Automatically generated
#
class CoreInformation(object):
	def getBaseAddress(self):
		return 0x6000
	def getMainVector(self):
		return 0x6003
	def getNextFreeCode(self):
		return 0x6007
	def getNextFreeDictionary(self):
		return 0x6005
	def getTemporaryWorkspace(self):
		return 0x600a
	def getDictionaryTable(self):
		return 0x6012
	def createDictionaryItems(self,dict):
		dict.addCoreWord("swap",0,1)
		dict.addCoreWord("over",2,1)
		dict.addCoreWord("dup",5,1)
		dict.addCoreWord("drop",7,1)
		dict.addCoreWord("xor",8,1)
		dict.addCoreWord("and",11,1)
		dict.addCoreWord("or",15,1)
		dict.addCoreWord("-",18,1)
		dict.addCoreWord("0<",21,1)
		dict.addCoreWord("negate",24,1)
		dict.addCoreWord("@",27,1)
		dict.addCoreWord("!",29,1)
		dict.addCoreWord("rot",32,1)
		dict.addCoreWord("0=",35,1)
		dict.addCoreWord("not",35,1)
		dict.addCoreWord("<",38,1)
		dict.addCoreWord(">",43,1)
		dict.addCoreWord("=",45,1)
		dict.addCoreWord("u<",49,1)
		dict.addCoreWord("?dup",52,1)
		dict.addCoreWord("nip",55,1)
		dict.addCoreWord("2*",57,1)
		dict.addCoreWord("2/",59,1)
		dict.addCoreWord("d2/",61,1)
		dict.addCoreWord("d2*",65,1)
		dict.addCoreWord("[halt]",68,2)
		dict.addCoreWord("[;]",69,2)
		dict.addCoreWord("pop",71,2)
		dict.addCoreWord("push",74,2)
		dict.addCoreWord("+",77,1)
		dict.addCoreWord("[literal.s]",79,2)
		dict.addCoreWord("[literal]",81,2)
		dict.addCoreWord("[string.literal]",84,2)
		dict.addCoreWord("[br.pos]",87,2)
		dict.addCoreWord("[br.zero]",89,2)
		dict.addCoreWord("+!",95,1)
		dict.addCoreWord("c!",99,1)
		dict.addCoreWord("c@",101,1)
		dict.addCoreWord("debug",103,2)
		dict.addCoreWord("screen!",104,1)
		dict.addCoreWord("colour!",105,1)
		dict.addCoreWord("cls",106,1)
		dict.addCoreWord("cursor!",107,1)
		dict.addCoreWord("port@",108,1)
		dict.addCoreWord("port!",109,1)
		dict.addCoreWord("keyboard@",110,1)
		dict.addCoreWord("dump.stack",111,1)
		dict.addCoreWord("i",112,1)
		dict.addCoreWord("[next]",113,2)
