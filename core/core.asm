; **********************************************************************************************************
;
;		Name:		core.asm
;		Purpose:	Main file for Z80 Forth Core
;		Author:		Paul Robson (paul@robsons.org.uk)
;		Date:		1st February 2018
;
; **********************************************************************************************************

BaseAddress:	equ $6000
CodeBaseAddress:equ $8000

		org		BaseAddress 							; where we start
		opt 	zxnext 									; on our ZXNext
		include "dictionary.asm"						; dictionary and other vectors

		org 	CodeBaseAddress 						; words have to go $8000-$FFFF
		include "io.asm" 								; I/O Routines
		include "words.asm"								; Words

; **********************************************************************************************************
;										Initialisation/Support code
; **********************************************************************************************************

initialise:
		di 												; no interrupts
		ld 		sp,$FFFF 								; initialise our stack just so this will work.
		call 	ResetStack 								; then properly initialise them :)
		call 	IO_ClearScreen 							; clear the screen/border
		ld 		de,$0000								; top of stack value.
		ld  	hl,(VectorMainAddress)					; and run the __main word.
		jp 		(hl)

; **********************************************************************************************************
;											Stack reset code
; **********************************************************************************************************

ResetStack:
		pop 	hl 										; so we can go back.
		ld 		sp,$0000								; return stack
		jp 		(hl)

__NextFreeProgramAddress: 								; marks the end of code

; **********************************************************************************************************
;
;		write out .sna and .bin
;
; **********************************************************************************************************

		savesna	"core.sna",start,$5BFE
		savebin "core.bin",start,__NextFreeProgramAddress-start

