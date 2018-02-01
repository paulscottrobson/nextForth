; **********************************************************************************************************
;
;		Name:		system.asm
;		Purpose		System Primitive Words for Z80 CMForth Core
;		Author:		Paul Robson (paul@robsons.org.uk)
;		Date:		28th January 2018
;
; **********************************************************************************************************

; **********************************************************************************************************
;										  debug : Enter CSpect Debugger
; **********************************************************************************************************

WD_Debug: 												; ==== debug ====
		db 		$DD,$01 								
		jp 		(ix)
		
; **********************************************************************************************************
;										screen! : write to screen
; **********************************************************************************************************

WD_ScreenWrite8:										; ==== screen! ====
		jp 		WXScreenWrite8
		db 		0

; **********************************************************************************************************
;									colour! : set write colour
; **********************************************************************************************************

WD_SetColour:											; ==== colour! ====
		jp 		WXSetColour
		db 		0

; **********************************************************************************************************
;									 	cls : Clear Screen
; **********************************************************************************************************

WD_ClearScreen:											; ==== cls ====
		jp 		WXClearScreen
		db 		0

; **********************************************************************************************************
;									cursor! : Set Cursor position
; **********************************************************************************************************

WD_SetCursor:											; ==== cursor! ====
		jp 		WXSetCursor
		db 		0

; **********************************************************************************************************
;											port@ : Read I/O port
; **********************************************************************************************************

WD_ReadPort:											; ==== port@ ====
		jp 		WXReadPort
		db 		0

; **********************************************************************************************************
;											port! : Write I/O port
; **********************************************************************************************************

WD_WritePort: 											; ==== port! ====
		jp 		WXWritePort
		db 		0

; **********************************************************************************************************
;								   keyboard@ : read key pressed or 0
; **********************************************************************************************************

WD_ReadKeyboard:										; ==== keyboard@ ====
		jp 		WXReadKeyboard
		db 		0
	
WD_DumpStack:											; ==== dump.stack ====
		jp 		WXDumpStack
		db 		0

WD_I:													; ==== i ====
		jp 		WXGetIndex
		db 		0

; **********************************************************************************************************
;											[next] : next handler
; **********************************************************************************************************

WD_Next:												; ==== [next] ====
		ld 		l,c 									; return stack pointer in HL
		ld 		h,b
		ld 		a,(hl) 									; if LSB is zero
		or 		a
		jr 		nz,__NextNoDec
		inc 	hl 										; decrement the MSB of the counter
		dec 	(hl)
		dec 	hl
__NextNoDec:
		dec 	(hl) 									; decrement the LSB of the count

		ld 		a,(hl) 									; check if count is zero.
		inc 	hl
		or 		(hl)
		jr 		nz,__NextLoop 							; if not, do the loop
		inc 	de 										; set over the branch offset.
		inc 	c 										; throw the counter.
		inc 	c 
		jp 		(ix) 									; and exit
;
__NextLoop:
		ld 		a,(de) 									; get offset back
		inc 	de
		ld 		l,a 									; put as a negative offset in HL
		ld 		h,$FF
		add 	hl,de 									; calculate return address
		ex 		de,hl 									; put in DE
		jp 		(ix) 									; and exit.

ScreenCopy:
		exx
		pop 	bc 										; size
		pop 	hl 										; start pos on screen
		pop 	de 										; source of data.
__SCLoop:
		ld 		a,(de)									; read character
		call 	IO_WriteCharacter 						; write to screen at HL
		inc 	hl 										; bump pos and pointer
		inc 	de
		dec 	bc 										; dec count
		ld 		a,b
		or 		c
		jr 		nz,__SCLoop
		exx
		jp 		(ix)
		db 		0,0		

WXReadKeyboard:
		call 	IO_ScanKeyboard
		ld 		l,a
		ld 		h,0
		push 	hl
		jp 		(ix)
;
WXSetCursor:
		exx
		pop 	hl
		call 	IO_SetCursor
		exx
		jp 		(ix)
;
WXClearScreen:
		exx
		call 	IO_ClearScreen
		ld 		hl,0
		call 	IO_SetCursor
		exx 
		jp 		(ix)
;
WXSetColour:
		pop 	hl
		ld 		a,l
		ld 		(IOWC_Colour),a
		jp 		(ix)
;
WXScreenWrite8:
		exx
		pop 	hl
		pop 	de
		ld 		a,e
		call 	IO_WriteCharacter
		exx
		jp 		(ix)
;
WXReadPort:
		exx
		pop 	bc 										; address in BC	
		in 		l,(c) 									; read into L
		ld 		h,0
		push 	hl
		exx
		jp 		(ix)
		db 		0,0

WXWritePort:
		exx
		pop 	bc 										; address in BC	
		pop 	hl 										; data in L
		out 	(c),l 									; write it.
		exx
		jp 		(ix)
;
WXDumpStack:
		call 	IO_DumpStack
		jp 		(ix)
;
WXGetIndex:
		ld 		a,(bc)
		ld 		l,a
		inc 	c
		ld 		a,(bc)
		ld 		h,a
		dec 	c
		push 	hl
		jp 		(ix)
		db 		0,0,0
