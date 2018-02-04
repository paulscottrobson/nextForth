;
;	Word:				cursor!
;	Dictionary:			(a - ) 
;	Date:				4th February 2018
;	Macro: 				No
;	Notes:
;

		pop 	ix
		ex 		de,hl
		call	IO_SetCursor
		pop 	de
		jp	 	(ix)

