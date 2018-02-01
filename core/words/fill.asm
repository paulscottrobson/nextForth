;
;	Word:				FILL
;	Dictionary:			(a # n - ) 
;	Date:				1st February 2018
;	Macro: 				No
;	Notes:
;

		pop 	ix
		pop 	bc 			; # to copy
		pop 	hl 			; target address
__Fill0:ld 		a,b 		; check copy # zero
		or 		c
		jr 		z,__Fill1
		dec 	bc 			; dec counter
		ld 		(hl),e 		; copy one character
		inc 	hl
		jr 		__Fill0

__Fill1:pop 	de		
		jp	 	(ix)

