		org		$6000
		opt 	zxnext
start:	incbin 	"forth.bin"
		savesna	"forth.sna",start,$5BFE
