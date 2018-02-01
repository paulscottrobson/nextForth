; **********************************************************************************************************
;
;		Name:		io.asm
;		Purpose:	Screen/Keyboard I/O
;		Author:		Paul Robson (paul@robsons.org.uk)
;		Date:		23rd January 2018
;
; **********************************************************************************************************

; **********************************************************************************************************
;											  Clear Screen
; **********************************************************************************************************

IO_ClearScreen:
		push 	af
		push 	hl
		ld 		hl,$4000 					
__WDS1:	ld 		(hl),0 									; clear screen pixels
		inc 	hl
		ld 		a,h
		cp 		$58
		jr 		nz,__WDS1
__WDS2:	ld 		(hl),7 									; clear attributes
		inc 	hl
		ld 		a,h
		cp 		$5B
		jr 		nz,__WDS2
		xor 	a 										; black border
		out 	($FE),a
		pop 	hl
		pop 	af
		ret

; **********************************************************************************************************
;										 Set the cursor to (HL)
; **********************************************************************************************************

IO_SetCursor:
		push 	af
		push 	hl
		ld 		hl,(_IOSCOldCursor) 					; erase the old cursor
		res 	7,(hl)
		pop 	hl
		ld 		a,h
		cp 		3
		jr 		nc,__IOSCRExit
		push 	hl
		or 		$58									
		ld 		h,a
		set 	7,(hl)
		ld 		(_IOSCOldCursor),hl
		pop 	hl
__IOSCRExit:
		pop 	af
		ret

_IOSCOldCursor:
		dw 		$5800

; **********************************************************************************************************
;												Dump Stack
; **********************************************************************************************************

IO_DumpStack:
		pop 	hl 										; return address
		exx 				
		ld 		hl,0 									; HL <- SP
		add 	hl,sp
		ld 		b,h 									; SP now in BC
		ld 		c,l
		ld 		hl,$0000 								; start at screen top
		ld 		a,'>'
		call 	IO_WriteCharacter
		inc 	hl
__IODS1: 												; dump the stack working back up.
		ld 		a,c 									; reached the top (128 byte page)
		and 	$7F
		jr 		z,__IODSExit
		ld 		a,(bc) 									; pop a value off the stack
		ld 		e,a
		inc 	bc
		ld 		a,(bc)
		ld 		d,a
		inc 	bc
		call 	IO_WriteHex
		ld 		de,32
		add 	hl,de
		jr 		__IODS1 								; go round and print it.
__IODSExit:
		exx 
		jp 		(hl)

; **********************************************************************************************************
;									Write DE in hex to screen at HL
; **********************************************************************************************************

IO_WriteHex:
		push 	af
		push 	hl
		ld 		a,d
		call 	__IOWHexByte
		ld 		a,e
		call 	__IOWHexByte
		pop 	hl
		pop 	af
		ret
;
__IOWHexByte:
		push 	af
		rra
		rra
		rra
		rra
		call 	__IOWHexNibble
		pop 	af
__IOWHexNibble:
		and 	$0F
		cp 		10
		jr 		c,__IOWHexNibble2
		add 	a,7
__IOWHexNibble2:
		add 	a,$30
		call 	IO_WriteCharacter
		inc 	l
		ret

; **********************************************************************************************************
;						Write character A (2 + 6 bit) to screen at position HL
; **********************************************************************************************************

IO_WriteCharacter:
		push 	af 										; save registers
		push 	bc
		push 	de
		push 	hl

		ld 		b,a 									; save character code in A.

		ld 		a,h 									; check HL in range
		cp 		3
		jr 		nc,IO__WCExit

		or 		$58 									; point into attribute memory
		ld 		h,a 									; HL points to attribute
		ld 		a,(IOWC_Colour) 						; writing colour
		ld 		c,a

		ld 		a,(hl) 									; read it, preserve bit 7	
		and 	$80
		or		$40 									; set brightness
		or 		c 										; set colour
		ld 		(hl),a 									; and write back.

		ld 		a,h 									; get offset in character area
		and 	3 										; shift Y6,Y7 into position
		add 	a,a
		add 	a,a
		add 	a,a
		or	 	$40 									; make it a screen address
		ld 		h,a 									; in HL
		ex 		de,hl 									; put in DE

		ld 		a,b 									; get character code
		and 	$7F
		add 	a,a 
		ld 		l,a 									; L = character code x 2
		ld 		h,$03C / 4  							; HL = code x 2 + $3C00/4
		add 	hl,hl 
		add 	hl,hl 									; HL = code x 8 + $3C00
		ld 		b,8
__DCCopy: 												; copy character.
		ld 		a,(hl)
		ld 		(de),a
		inc 	d
		inc 	hl
		djnz	__DCCopy

IO__WCExit:
		pop 	hl
		pop 	de
		pop 	bc
		pop 	af
		ret

IOWC_Colour: 											; write attribute colour.
		db 		4

; **********************************************************************************************************
;										Read current key pressed into A
; **********************************************************************************************************

IO_ScanKeyboard:
		push 	bc
		push 	de
		push 	hl

		ld 		hl,KBD_NoShift 							; firstly identify shift state.

		ld 		a,$FE 									; check CAPS SHIFT (emulator : left shift)
		in 		a,($FE)
		bit 	0,a
		jr 		nz,__IOSCShift1
		ld 		hl,KBD_Shift
__IOSCShift1:
		ld 		a,$7F 									; check SYMBOL SHIFT (emulator : right shift)
		in 		a,($FE)
		bit 	1,a
		jr 		nz,__IOSCShift2
		ld 		hl,KBD_SymbolShift
__IOSCShift2:

		ld 		e,$FE 									; scan pattern.
__IOSC1:ld 		a,e 									; work out the mask, so we don't detect shift keys
		ld 		d,$1E  									; $FE row, don't check the least significant bit.
		cp 		$FE
		jr 		z,__IOSC2
		ld 		d,$1D 									; $7F row, don't check the 2nd least significant bit
		cp 		$7F
		jr 		z,__IOSC2
		ld 		d,$1F 									; check all bits.
__IOSC2:
		ld 		a,e 									; scan the keyboard
		in 		a,($FE)
		cpl 											; make that active high.
		and 	d  										; and with check value.
		jr 		nz,__IOSCKeyPressed 					; exit loop if key pressed.

		inc 	hl 										; next set of keyboard characters
		inc 	hl
		inc 	hl
		inc 	hl
		inc 	hl

		ld 		a,e 									; get pattern
		add 	a,a 									; shift left
		or 		$01 									; set bit 1.
		ld 		e,a

		cp 		$FF 									; finished when all 1's.
		jr 		nz,__IOSC1 
		xor 	a
		jr 		__IOSCExit 								; no key found, return with zero.
;
__IOSCKeyPressed:
		inc 	hl  									; shift right until carry set
		rra
		jr 		nc,__IOSCKeyPressed
		dec 	hl 										; undo the last inc hl
		ld 		a,(hl) 									; get the character number.
__IOSCExit:
		pop 	hl
		pop 	de
		pop 	bc
		ret

; **********************************************************************************************************
;											Keyboard Mapping Tables
; **********************************************************************************************************
;
;	$FEFE-$7FFE scan, bit 0-4, active low
;
;	8:Backspace 13:Return 16:19 colours 0-3 20-23:Left Down Up Right 32-95: Std ASCII
;
KBD_NoShift:
		db 		0,  'Z','X','C','V',			'A','S','D','F','G'
		db 		'Q','W','E','R','T',			'1','2','3','4','5'
		db 		'0','9','8','7','6',			'P','O','I','U','Y'
		db 		13, 'L','K','J','H',			' ', 0, 'M','N','B'

KBD_SymbolShift:
		db 		 0, ':', 0,  '?','/',			'~','|','\','{','}'
		db 		 0,  0,  0  ,'<','>',			'!','@','#','$','%'
		db 		'_',')','(',"'",'&',			'"',';', 0, ']','['
		db 		13, '=','+','-','^',			' ', 0, '.',',','*'

KBD_Shift:
		db 		0,  ':',0  ,'?','/',			'~','|','\','{','}'
		db 		0,  0,  0  ,'<','>',			'!','@','#','$',20
		db 		8, ')',23,  22, 21,				'"',';', 0, ']','['
		db 		13, '=','+','-','^',			' ', 0, '.',',','*'

