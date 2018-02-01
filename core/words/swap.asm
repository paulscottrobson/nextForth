;
;	Word:				SWAP
;	Dictionary:			(a b - b a)
;	Date:				1st February 2018
;	Macro: 				Yes
;	Notes:
;
		pop 	ix
		pop 	hl
		push 	de
		ex 		de,hl
		jp 		(ix)
