;
;	Word:				-
;	Dictionary:			(a b - a)
;	Date:				1st February 2018
;	Macro: 				Yes
;	Notes:
;

		pop 	ix

		pop 	hl
		xor 	a
		sbc 	hl,de
		ex 		de,hl

		jp 		(ix)