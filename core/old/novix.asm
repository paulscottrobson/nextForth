; **********************************************************************************************************
;
;		Name:		novix.asm
;		Purpose		System Words for Z80 CMForth Core implement on Novice CPU (4)
;					Words for the compiler.
;		Author:		Paul Robson (paul@robsons.org.uk)
;		Date:		28th January 2018
;
; **********************************************************************************************************

; **********************************************************************************************************
;											nip : delete 2nd
; **********************************************************************************************************

WD_Nip:	pop 	hl 										; ==== nip ====
		pop 	af
		push 	hl
		jp 		(ix)
		db 		0,0,0

; **********************************************************************************************************
;												2* : Double TOS
; **********************************************************************************************************

WD_2Times:												; ==== 2* ====
		pop 	hl
		add 	hl,hl
		push 	hl
		jp 		(ix)
		db 		0,0,0

; **********************************************************************************************************
;							   		   		2/ : arithmetic shift right
; **********************************************************************************************************

WD_Div2:pop 	hl 										; ==== 2/ ====
		sra 	h
		rr 		l
		push 	hl
		jp 		(ix)

; **********************************************************************************************************
;							   		   D2/ : doubele arithmetic shift right
; **********************************************************************************************************

WD_DDiv2:		 										; ==== D2/ ====
		exx
		pop 	de 										; low order
		pop 	hl 										; high order
		sra 	h 										; shift right
		rr 		l
		rr 		d
		rr 		e
		push 	de 										; low
		push 	hl 										; high
		exx
		jp 		(ix)

; **********************************************************************************************************
;							   		   D2* : doubele arithmetic shift left
; **********************************************************************************************************

WD_DMul2:		 										; ==== D2* ====
		exx
		pop 	hl 										; low order
		pop 	de 										; high order
		add 	hl,hl
		ex 		de,hl
		adc 	hl,hl
		push 	hl 										; high
		push 	de 										; low
		exx
		jp 		(ix)

; **********************************************************************************************************
;										halt : stop program running
; **********************************************************************************************************

WD_Halt: 												; ==== [halt] ==== 
		halt
		jr 		WD_Halt
		nop

; **********************************************************************************************************
;												Return from word
; **********************************************************************************************************

WD_Return:												; ==== [;] ====
		ld 		a,(bc)
		ld 		e,a
		inc 	c
		ld 		a,(bc)
		ld 		d,a
		inc 	c
		jp 		(ix)

; **********************************************************************************************************
;										pop : Return Stack -> Data Stack
; **********************************************************************************************************

WD_Pop:													; ==== pop ====
		ld 		a,(bc)
		ld 		l,a
		inc 	c
		ld 		a,(bc)
		ld 		h,a
		inc 	c
		push 	hl
		jp 		(ix)
		db 		0,0,0

; **********************************************************************************************************
;										push : Data Stack -> Return Stack
; **********************************************************************************************************

WD_Push:												; ==== push ====
		pop 	hl
		dec 	c
		ld 		a,h
		ld 		(bc),a
		dec 	c
		ld 		a,l
		ld 		(bc),a
		jp 		(ix)
		db 		0,0,0

; **********************************************************************************************************
;									   + : add top two stack values
; **********************************************************************************************************

WD_Add:	exx												; ==== + ====
		pop 	hl
		pop 	de
		add 	hl,de
		push 	hl
		exx
		jp 		(ix)
										
; **********************************************************************************************************
;									  [literal.s] : 0-255 short literal
; **********************************************************************************************************

WD_ShortLiteral:										; ==== [literal.s] ====
		ld 		a,(de)
		inc 	de
		ld 		l,a
		ld 		h,0
		push 	hl
		jp 		(ix)

; **********************************************************************************************************
;									  [literal] : 16 bit literal
; **********************************************************************************************************

WD_Literal:												; ==== [literal] ====
		ld 		a,(de)
		inc 	de
		ld 		l,a
		ld 		a,(de)
		inc 	de
		ld 		h,a
		push 	hl
		jp 		(ix)
		db 		0,0,0

; **********************************************************************************************************
;							[string.literal] : Push following text
; **********************************************************************************************************

WD_StringLiteral: 										; ==== [string.literal] ====
		push 	de 										; save address of string.
		ex 		de,hl 									; address in HL
		ld 		e,(hl)									; length in DE
		ld 		d,0
		add 	hl,de 									; advance past string end.
		inc 	hl
		ex 		de,hl 									; back in DE
		jp 		(ix) 									; and exit
		db 		0,0
				
; **********************************************************************************************************
;							[br.pos] : short branch if TOS positive destructive
; **********************************************************************************************************

WD_BrPos:												; ==== [br.pos] ====
		pop 	hl
		bit 	7,h
		jr 		z,__DoBranch
		jr 		__SkipBranch
		db 		0

; **********************************************************************************************************
;							[br.zero] : short branch if TOS zero destructive
; **********************************************************************************************************

WD_BrZero:												; ==== [br.zero] ====
		pop 	hl
		ld 		a,h
		or 		l
		jr 		z,__DoBranch
__SkipBranch:
		inc 	de
		jp 		(ix)
;
__DoBranch:
		ld 		h,0 									; branch offset in HL
		ld 		a,(de)
		ld 		l,a
		inc 	de
		bit 	7,l 									; sign extend.
		jr 		z,__DoBranch2
		dec 	h
__DoBranch2:
		add 	hl,de 									; add to code address
		ex 		de,hl 									; put it back
		jp 		(ix)
		db 		0,0
