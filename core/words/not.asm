;
;	Word:				NOT
;	Dictionary:			(a - a)
;	Date:				1st February 2018
;	Macro: 				No
;	Notes:
;

		pop 	hl

		ld 		a,d
		or 		e
		ld 		de,$0000
		jr 		nz,__Not
		dec 	de
__Not:
		jp	 	(hl)
		