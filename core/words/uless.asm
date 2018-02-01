;
;	Word:				U<
;	Dictionary:			(a b - a)
;	Date:				1st February 2018
;	Macro: 				No
;	Notes:
;

		pop 	ix
		pop		hl
		xor 	a
		sbc 	hl,de
		ld 		de,0
		jr 		nc,__ULess
		dec 	de
__ULess:
		jp	 	(ix)