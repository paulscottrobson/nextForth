;
;	Word:				i.fetch
;	Dictionary:			( - n) 
;	Date:				4th February 2018
;	Macro: 				No
;	Notes:
;

		pop 	ix
		push 	de 						; save current TOS
		ld 		e,(hl) 					; get address where the count is.
		inc 	hl
		ld 		d,(hl)
		ex 		de,hl 					; get the count
		ld 		e,(hl)
		inc 	hl
		ld 		d,(hl)
		jp	 	(ix)

