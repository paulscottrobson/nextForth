;
;	Word:				abs
;	Dictionary:			(a - a) or (a - a b)
;	Date:				1st February 2018
;	Macro: 				No
;	Notes:
;

		pop 	ix

		bit 	7,d
		jr 		z,__Abs
		xor 	a
		ld 		l,a
		ld 		h,a
		sbc 	hl,de
		ex 		de,hl
__Abs:
		jp	 	(ix)

		