#
#		Scan words file.
#
import os,re,sys

wordList = {}

directories = [ "words" ]
idCount = 1000

print("Scanning directories for words")
#
#	Scan for words.
#
for d in directories:
	print("    "+d)
	files = [x for x in os.listdir(d) if x[-4:] == ".asm"]
	for f in files:
		source = [x.rstrip() for x in open(d+os.sep+f).readlines()]
		entry = { "id": idCount,"source":source,"macro":False }
		idCount += 1
		for l in [x.lower() for x in source if x != "" and x[0] == ";"]:
			m = re.match("^\;\s*word\:\s*(.*)\s*$",l)
			if m is not None:
				entry["name"] = m.group(1).strip()
			m = re.match("^\;\s*macro\:\s*(.*)\s*$",l)
			if m is not None:
				entry["macro"] = m.group(1)[0] == 'y'
		assert "name" in entry,"Missing words "+l

		wordList[entry["name"]] = entry

words = [x for x in wordList.keys()]
words.sort()
h = open("words.asm","w")
for w in words:
	wd = wordList[w]
	h.write("WordID_{0:04}_Entry: ; *** {1} ***\n".format(wd["id"],w))
	src = [x.replace("\t"," ") for x in wd["source"] if x.strip() != ""]
	src = [x for x in src if x[0] != ';']
	h.write("\n".join(src))
	h.write("\nWordID_{0:04}_Exit:\n\n".format(wd["id"]))
h.close()

infoArray = []
for w in words:
	wd = wordList[w]
	info = w+":"+str(wd["id"])+":"+("Y" if wd["macro"] else "N")
	infoArray.append(info)
h = open("word.info","w")
h.write(";".join(infoArray))
h.close()

print("Found {0} and generated assembly and info file".format(len(words)))