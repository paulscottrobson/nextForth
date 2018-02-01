;
;	Word:				<
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
		bit 	7,h
		jr 		z,__Less
		dec 	de
__Less:
		jp	 	(ix)