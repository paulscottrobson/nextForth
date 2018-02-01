;
;	Word:				OR
;	Dictionary:			(a b - a)
;	Date:				1st February 2018
;	Macro: 				Yes
;	Notes:
;

		pop 	hl

		pop 	bc

		ld 		a,d
		or 		b
		ld 		d,a

		ld 		a,e
		or 		c
		ld 		e,a

		jp	 	(hl)