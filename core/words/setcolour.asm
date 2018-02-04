;
;	Word:				colour!
;	Dictionary:			(a - ) 
;	Date:				4th February 2018
;	Macro: 				No
;	Notes:
;

		pop 	hl
		ld 		a,e
		ld 		(IOWC_Colour),a
		pop 	de
		jp	 	(hl)

