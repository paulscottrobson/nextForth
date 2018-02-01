;
;	Word:				OVER
;	Dictionary:			(a b - a b a)
;	Date:				1st February 2018
;	Macro: 				Yes
;	Notes:
;
		pop 	ix

		pop 	hl 					; 2nd on stack
		push 	hl 					; push back
		push 	de 					; push TOS
		ex 		de,hl 				; 2nd to TOS 

		jp 		(ix)
		