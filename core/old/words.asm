; **********************************************************************************************************
;
;		Name:		words.asm
;		Purpose:	Dictionary Words for Z80 CMForth Core
;		Author:		Paul Robson (paul@robsons.org.uk)
;		Date:		28th January 2018
;
; **********************************************************************************************************

		org 	CodeBaseAddress

		include "primitives.asm"
		include "novix.asm"
		include "memory.asm"
		include "system.asm"

; missing WITHIN ABS MAX MIN 2DUP 2DROP MOVE FILL
; TIMES	
; no 2/MOD as 8 bit byte system.

