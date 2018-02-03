# **********************************************************************************************************
#
#		Name:		process.py
#		Purpose:	Scan assembly file(s) and 
#		Author:		Paul Robson (paul@robsons.org.uk)
#		Date:		23rd January 2018
#
# **********************************************************************************************************

import re,sys
#
#	Alignment on page.
#
alignment = 4
#
#	Get the labels to address mapping
#
labelsToAddress = {}
for l in [x.strip().replace("\t"," ") for x in open("core.asm.dat.vice").readlines() if x.strip() != ""]:
	m = re.match("^al\s*C\:([0-9A-F]+)\s*\_([A-Za-z\_0-9]+)\s*$",l)
	assert m is not None,"Can't process '"+l+"' from core.asm.dat.vice"
	if m.group(2)[0] != "_":
		labelsToAddress[m.group(2).upper()] = int(m.group(1),16)
#
#	Load in binary file.
#
memory = [ None ] * 0x10000
binary = open("core.bin","rb").read(32767)
start = labelsToAddress["START"]
for n in range(0,len(binary)):
	memory[start+n] = binary[n]
#
#	Mapping of labels to Python functions returning that value.
#
labelsToFunctions = {}
labelsToFunctions["START"] = "SystemBaseAddress"
labelsToFunctions["VECTORMAINADDRESS"] = "MainRoutineVector"
labelsToFunctions["NEXTFREEDICTIONARY"] = "DictionaryNextFreePointer"
labelsToFunctions["NEXTFREECODE"] = "CodeNextFreePointer"
labelsToFunctions["WORKSPACE"] = "WorkspaceAddress"
labelsToFunctions["DICTIONARYTABLE"] = "DictionaryTableBase"

for k in labelsToFunctions.keys():
	assert k in labelsToAddress,"Missing address for '"+k+"'"
#
#	Generate class/address info.
#
h = open("coreinfo.py","w")
h.write("#\n# Automatically generated\n#\n")
h.write("class CoreInformation(object):\n")
for k in labelsToFunctions:
	h.write("\tdef get{0}(self):\n".format(labelsToFunctions[k]))
	h.write("\t\treturn 0x{0:04x}\n".format(labelsToAddress[k]))
#
#	Generate code to generate dictionary information.
#
wordData = []
for d in open("word.info").read(32768).split(";"):
	wordData.append(d.split(":"))
#
h.write("\tdef createDictionaryItems(self,dict):\n")
#
for n in range(0,len(wordData)):
	wordInfo = wordData[n]
	word = wordInfo[0]
	wStart = labelsToAddress["WORDID_{0:4}_ENTRY".format(wordInfo[1])]
	wExit = labelsToAddress["WORDID_{0:4}_EXIT".format(wordInfo[1])]
	
	h.write('\t\tdict.addCallWord("{0}",0x{1:04x})\n'.format(word,wStart))
#
for n in range(0,len(wordData)):
	wordInfo = wordData[n]
	if wordInfo[2] == 'Y':
		word = wordInfo[0]
		wStart = labelsToAddress["WORDID_{0:4}_ENTRY".format(wordInfo[1])]
		wExit = labelsToAddress["WORDID_{0:4}_EXIT".format(wordInfo[1])]
		processed = False
		if memory[wStart] == 0xDD and memory[wStart+1] == 0xE1:			# POP IX
			if memory[wExit-2] == 0xDD and memory[wExit-1] == 0xE9:		# JP (IX)
				processed = True 
				wStart += 2
				wExit -= 2
		if not processed and memory[wStart] == 0xE1:					# POP HL
			if memory[wExit-1] == 0xE9:									# JP (HL)
				processed = True 
				wStart += 1
				wExit -= 1
		if not processed and memory[wExit-1] == 0xC9:					# RET (end)
			processed = True
			wExit -= 1
		h.write('\t\tdict.addMacroWord("{0}",0x{1:04x},0x{2:04x})\n'.format(word,wStart,wExit))


h.close()