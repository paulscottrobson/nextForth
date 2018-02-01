;
;	Word:				*
;	Dictionary:			(a b - c)
;	Date:				1st February 2018
;	Macro: 				No
;	Notes:
;

		pop 	ix
		pop 	bc 					; BC,DE mult values
		ld 		hl,0 				; Result
		
__Mult0:bit 	0,c 				; check LSB BC
		jr 		z,__Mult1
		add 	hl,de 				; if non zero add DE to result
__Mult1:srl 	b 					; shift BC right
		rr		c
		ex 		de,hl 				; shift DE left
		add 	hl,hl
		ex 		de,hl
		ld 		a,b 				; go back if BC non zero
		or 		c
		jr 		nz,__Mult0

		ex 		de,hl 				; result to TOS
		jp	 	(ix)

