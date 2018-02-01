;
;	Word:				XOR
;	Dictionary:			(a b - a)
;	Date:				1st February 2018
;	Macro: 				Yes
;	Notes:
;

		pop 	hl

		pop 	bc

		ld 		a,d
		xor 	b
		ld 		d,a

		ld 		a,e
		xor 	c
		ld 		e,a

		jp	 	(hl)