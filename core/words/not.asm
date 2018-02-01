;
;	Word:				NOT
;	Dictionary:			(a - a)
;	Date:				1st February 2018
;	Macro: 				Yes
;	Notes:
;

		ld 		a,d
		cpl
		ld 		d,a
		ld 		a,e
		cpl 
		ld 		e,a

		ret