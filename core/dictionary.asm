; **********************************************************************************************************
;
;		Name:		dictionary.asm
;		Purpose:	Dictionary and Variables
;		Author:		Paul Robson (paul@robsons.org.uk)
;		Date:		1st February 2018
;
; **********************************************************************************************************

;
;				Run from here
;
Start:	jp 		initialise 								; run initialisation code.
		
;
;				This is the address of first FORTH word to be run. It is patched by the compiler.
;
VectorMainAddress:
		dw 		DummyCode

DummyCode:												; dummy start routine.
		jr 		DummyCode
;
;				This is the next free byte in the dictionary, which is fixed up by the 
;				compiler.
;
NextFreeDictionary:
		dw 		__NextFreeDictionaryAddress
;
;				Next free byte in code, which is a page address.
;
NextFreeCode:
		dw 		__NextFreeProgramAddress
		db 		0
;
;				Eight bytes of temporary workspace
;
Workspace:
		dw 		0,0,0,0
;
;				Empty dictionaries. There are four of these. FORTH is 1 and Compiler 2.
;				They point to the head word of their dictionaries. Context keeps the current one.
;
DictionaryTable:
		dw 		0
		dw 		0
		dw		0
		dw 		0
;
;				Dictionary is kept seperately as in Color FORTH.
;	
__NextFreeDictionaryAddress:
