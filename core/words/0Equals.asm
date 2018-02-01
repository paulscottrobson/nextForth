;
;	Word:				0=
;	Dictionary:			(a - a)
;	Date:				1st February 2018
;	Macro: 				Yes
;	Notes:
;

		pop 	hl

		ld 		a,d
		or 		e
		ld 		de,$0000
		jr 		nz,__0Equals
		dec 	de
__0Equals:
		jp	 	(hl)