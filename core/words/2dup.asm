;
;	Word:				2dup
;	Dictionary:			(a b - a b a b) 
;	Date:				1st February 2018
;	Macro: 				Yes
;	Notes:
;

		pop 	ix

		pop 	hl
		push 	hl
		push 	de
		push 	hl

		jp	 	(ix)

