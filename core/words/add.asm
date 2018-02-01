;
;	Word:				+
;	Dictionary:			(a b - a)
;	Date:				1st February 2018
;	Macro: 				Yes
;	Notes:
;

		pop 	ix

		pop 	hl
		add 	hl,de
		ex 		de,hl

		jp 		(ix)