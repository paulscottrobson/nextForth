;
;	Word:				negate
;	Dictionary:			(a - a)
;	Date:				1st February 2018
;	Macro: 				Yes
;	Notes:
;

		pop 	ix

		xor 	a
		ld 		l,a
		ld 		h,a
		sbc 	hl,de
		ex 		de,hl
		
		jp 		(ix)