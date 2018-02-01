;
;	Word:				Move
;	Dictionary:			(as at n - ) 
;	Date:				1st February 2018
;	Macro: 				No
;	Notes:
;

		pop 	ix
		pop 	bc 			; target
		pop 	hl 			; source
__Move0:ld 		a,d 		; check count zero
		or 		e
		jr 		z,__Move1
		dec 	de 			; dec count
		ld 		a,(hl) 		; copy source
		inc 	hl
		ld 		(bc),a 		; to target
		inc 	bc
		jr 		__Move0
__Move1:
		pop 	de
		jp	 	(ix)

