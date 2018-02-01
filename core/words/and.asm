;
;	Word:				AND
;	Dictionary:			(a b - a)
;	Date:				1st February 2018
;	Macro: 				Yes
;	Notes:
;

		pop 	hl

		pop 	bc

		ld 		a,d
		and 	b
		ld 		d,a

		ld 		a,e
		and 	c
		ld 		e,a

		jp	 	(hl)