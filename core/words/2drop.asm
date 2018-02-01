;
;	Word:				2drop
;	Dictionary:			(a b a b - ) 
;	Date:				1st February 2018
;	Macro: 				Yes
;	Notes:
;

		pop 	hl

		pop 	bc
		push 	bc
		push 	bc
		push 	de

		jp	 	(hl)

