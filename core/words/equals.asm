;
;	Word:				=
;	Dictionary:			(a b - a)
;	Date:				1st February 2018
;	Macro: 				No
;	Notes:
;

		pop 	ix
		pop		hl
		xor 	a
		sbc 	hl,de
		ld 		a,h
		or 		l
		ld 		de,0
		jr 		nz,__Equals
		dec 	de
__Equals:
		jp	 	(ix)