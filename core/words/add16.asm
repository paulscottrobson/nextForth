;
;	Word:				+!
;	Dictionary:			(d a - )
;	Date:				1st February 2018
;	Macro: 				No
;	Notes:
;

		pop 	ix

		pop 	hl
		ld 		a,(de)
		add 	a,l
		ld 		(de),a
		inc 	de
		ld 		a,(de)
		adc 	a,h
		ld 		(de),a
		pop 	de
		
		jp 		(ix)