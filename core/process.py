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
#	Mapping of labels to Python functions returning that value.
#
labelsToFunctions = {}
labelsToFunctions["START"] = "getSystemBaseAddress"
labelsToFunctions["VECTORMAINADDRESS"] = "getMainRoutineVector"
labelsToFunctions["NEXTFREEDICTIONARY"] = "getDictionaryNextFreePointer"
labelsToFunctions["NEXTFREECODE"] = "getCodeNextFreePointer"
labelsToFunctions["WORKSPACE"] = "getWorkspaceAddress"
labelsToFunctions["DICTIONARYTABLE"] = "getDictionaryTableBase"

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
h.write("\tdef createDictionaryItems(self,dict):\n")


h.close()