;
;	Word:				?dup
;	Dictionary:			(a - a) or (a - a b)
;	Date:				1st February 2018
;	Macro: 				Yes
;	Notes:
;

		pop 	ix

		ld 		a,d
		or 		e
		jr 		z,__QDup
		push 	de
__QDup:

		jp	 	(ix)