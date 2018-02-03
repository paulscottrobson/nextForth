;
;	Word:				rot
;	Dictionary:			(a b c - b c a)
;	Date:				1st February 2018
;	Macro: 				Yes
;	Notes:
;

		pop 	ix

		pop		bc 			; 2nd
		pop 	hl 			; 3rd
		ex 		de,hl 		; 3rd to TOS, TOS->HL
		push 	bc 			; push value that was 2nd
		push 	hl 			; push old TOS

		jp 		(ix)