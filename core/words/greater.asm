;
;	Word:				>
;	Dictionary:			(a b - a)
;	Date:				1st February 2018
;	Macro: 				No
;	Notes:
;

		pop 	ix
		pop		hl
		xor 	a
		ex 		de,hl
		sbc 	hl,de
		ld 		de,0
		bit 	7,h
		jr 		z,__Greater
		dec 	de
__Greater:
		jp	 	(ix)