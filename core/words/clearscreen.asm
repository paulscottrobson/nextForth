;
;	Word:				clear.screen
;	Dictionary:			( - ) 
;	Date:				4th February 2018
;	Macro: 				Yes
;	Notes:
;

		pop 	hl
		call	IO_ClearScreen 
		jp	 	(hl)

