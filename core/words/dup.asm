;
;	Word:				DUP
;	Dictionary:			(a - a a)
;	Date:				1st February 2018
;	Macro: 				Yes
;	Notes:
;
		pop 	hl
		push 	de
		jp 		(hl)
		