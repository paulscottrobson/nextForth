;
;	Word:				screen!
;	Dictionary:			(a c - ) 
;	Date:				4th February 2018
;	Macro: 				No
;	Notes:
;

		pop 	ix
		ex 		de,hl
		pop 	de
		ld 		a,e
		call 	IO_WriteCharacter
		pop 	de
		jp	 	(ix)

