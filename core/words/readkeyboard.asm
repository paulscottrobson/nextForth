;
;	Word:				keyboard@
;	Dictionary:			( - k) 
;	Date:				4th February 2018
;	Macro: 				No
;	Notes:
;

		pop 	hl
		call 	IO_ScanKeyboard
		push 	de
		ld 		e,a
		ld 		d,0
		jp	 	(hl)

