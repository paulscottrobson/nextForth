;
;	Word:				c!
;	Dictionary:			(d a - )
;	Date:				1st February 2018
;	Macro: 				Yes
;	Notes:
;

		pop 	ix

		pop 	hl
		ld 		a,l
		ld 		(de),a
		
		pop 	de
		jp 		(ix)