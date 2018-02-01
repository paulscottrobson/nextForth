;
;	Word:				0<
;	Dictionary:			(a - a)
;	Date:				1st February 2018
;	Macro: 				Yes
;	Notes:
;

		pop 	hl

		bit 	7,d
		ld 		de,$0000
		jr 		z,__0Less
		dec 	de
__0Less:
		jp	 	(hl)