;
;	Word:				dump.stack
;	Dictionary:			( - )
;	Date:				1st February 2018
;	Macro: 				No
;	Notes:
;
		pop 	ix
		push 	de
		call	IO_DumpStack
		pop		de
		jp 		(ix)
