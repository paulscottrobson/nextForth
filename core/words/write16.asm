;
;	Word:				!
;	Dictionary:			(d a - )
;	Date:				1st February 2018
;	Macro: 				Yes
;	Notes:
;

		pop 	ix

		pop 	hl
		ex 		de,hl
		ld 		(hl),e
		inc 	hl
		ld 		(hl),d

		pop 	de
		jp 		(ix)