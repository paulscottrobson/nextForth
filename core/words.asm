WordID_1044_Entry: ; *** ! ***
  pop  ix
  pop  hl
  ex   de,hl
  ld   (hl),e
  inc  hl
  ld   (hl),d
  pop  de
  jp   (ix)
WordID_1044_Exit:

WordID_1026_Entry: ; *** * ***
  pop  ix
  pop  bc      ; BC,DE mult values
  ld   hl,0     ; Result
__Mult0:bit  0,c     ; check LSB BC
  jr   z,__Mult1
  add  hl,de     ; if non zero add DE to result
__Mult1:srl  b      ; shift BC right
  rr  c
  ex   de,hl     ; shift DE left
  add  hl,hl
  ex   de,hl
  ld   a,b     ; go back if BC non zero
  or   c
  jr   nz,__Mult0
  ex   de,hl     ; result to TOS
  jp   (ix)
WordID_1026_Exit:

WordID_1009_Entry: ; *** + ***
  pop  ix
  pop  hl
  add  hl,de
  ex   de,hl
  jp   (ix)
WordID_1009_Exit:

WordID_1010_Entry: ; *** +! ***
  pop  ix
  pop  hl
  ld   a,(de)
  add  a,l
  ld   (de),a
  inc  de
  ld   a,(de)
  adc  a,h
  ld   (de),a
  pop  de
  jp   (ix)
WordID_1010_Exit:

WordID_1040_Entry: ; *** - ***
  pop  ix
  pop  hl
  xor  a
  sbc  hl,de
  ex   de,hl
  jp   (ix)
WordID_1040_Exit:

WordID_1001_Entry: ; *** 0< ***
  pop  hl
  bit  7,d
  ld   de,$0000
  jr   z,__0Less
  dec  de
__0Less:
  jp   (hl)
WordID_1001_Exit:

WordID_1000_Entry: ; *** 0= ***
  pop  hl
  ld   a,d
  or   e
  ld   de,$0000
  jr   nz,__0Equals
  dec  de
__0Equals:
  jp   (hl)
WordID_1000_Exit:

WordID_1003_Entry: ; *** 1+ ***
  inc  de
  ret
WordID_1003_Exit:

WordID_1002_Entry: ; *** 1- ***
  dec  de
  ret
WordID_1002_Exit:

WordID_1042_Entry: ; *** 2* ***
  ex   de,hl
  add  hl,hl
  ex   de,hl
  ret
WordID_1042_Exit:

WordID_1007_Entry: ; *** 2+ ***
  inc  de
  inc  de
  ret
WordID_1007_Exit:

WordID_1006_Entry: ; *** 2- ***
  dec  de
  dec  de
  ret
WordID_1006_Exit:

WordID_1014_Entry: ; *** 2/ ***
  sra  d
  rr   e
  ret
WordID_1014_Exit:

WordID_1004_Entry: ; *** 2drop ***
  pop  hl
  pop  de
  pop  de
  jp   (hl)
WordID_1004_Exit:

WordID_1005_Entry: ; *** 2dup ***
  pop  ix
  pop  hl
  push  hl
  push  de
  push  hl
  jp   (ix)
WordID_1005_Exit:

WordID_1024_Entry: ; *** < ***
  pop  ix
  pop  hl
  xor  a
  sbc  hl,de
  ld   de,0
  bit  7,h
  jr   z,__Less
  dec  de
__Less:
  jp   (ix)
WordID_1024_Exit:

WordID_1018_Entry: ; *** = ***
  pop  ix
  pop  hl
  xor  a
  sbc  hl,de
  ld   a,h
  or   l
  ld   de,0
  jr   nz,__Equals
  dec  de
__Equals:
  jp   (ix)
WordID_1018_Exit:

WordID_1021_Entry: ; *** > ***
  pop  ix
  pop  hl
  xor  a
  ex   de,hl
  sbc  hl,de
  ld   de,0
  bit  7,h
  jr   z,__Greater
  dec  de
__Greater:
  jp   (ix)
WordID_1021_Exit:

WordID_1032_Entry: ; *** ?dup ***
  pop  ix
  ld   a,d
  or   e
  jr   z,__QDup
  push  de
__QDup:
  jp   (ix)
WordID_1032_Exit:

WordID_1033_Entry: ; *** @ ***
  ex   de,hl
  ld   e,(hl)
  inc  hl
  ld   d,(hl)
  ret
WordID_1033_Exit:

WordID_1019_Entry: ; *** [expand.macro] ***
__ExpandMacro:
  jr   __ExpandMacro
WordID_1019_Exit:

WordID_1008_Entry: ; *** abs ***
  pop  ix
  bit  7,d
  jr   z,__Abs
  xor  a
  ld   l,a
  ld   h,a
  sbc  hl,de
  ex   de,hl
__Abs:
  jp   (ix)
WordID_1008_Exit:

WordID_1011_Entry: ; *** and ***
  pop  hl
  pop  bc
  ld   a,d
  and  b
  ld   d,a
  ld   a,e
  and  c
  ld   e,a
  jp   (hl)
WordID_1011_Exit:

WordID_1045_Entry: ; *** c! ***
  pop  ix
  pop  hl
  ld   a,l
  ld   (de),a
  pop  de
  jp   (ix)
WordID_1045_Exit:

WordID_1034_Entry: ; *** c@ ***
  ex   de,hl
  ld   e,(hl)
  ld   d,0
  ret
WordID_1034_Exit:

WordID_1012_Entry: ; *** clear.screen ***
  pop  hl
  call IO_ClearScreen
  jp   (hl)
WordID_1012_Exit:

WordID_1038_Entry: ; *** colour! ***
  pop  hl
  ld   a,e
  ld   (IOWC_Colour),a
  pop  de
  jp   (hl)
WordID_1038_Exit:

WordID_1039_Entry: ; *** cursor! ***
  pop  ix
  ex   de,hl
  call IO_SetCursor
  pop  de
  jp   (ix)
WordID_1039_Exit:

WordID_1013_Entry: ; *** debug ***
  db   $DD,$01
  ret
WordID_1013_Exit:

WordID_1015_Entry: ; *** drop ***
  pop  hl
  pop  de
  jp   (hl)
WordID_1015_Exit:

WordID_1016_Entry: ; *** dump.stack ***
  pop  ix
  push  de
  call IO_DumpStack
  pop  de
  jp   (ix)
WordID_1016_Exit:

WordID_1017_Entry: ; *** dup ***
  pop  hl
  push  de
  jp   (hl)
WordID_1017_Exit:

WordID_1020_Entry: ; *** fill ***
  pop  ix
  pop  bc    ; # to copy
  pop  hl    ; target address
__Fill0:ld   a,b   ; check copy # zero
  or   c
  jr   z,__Fill1
  dec  bc    ; dec counter
  ld   (hl),e   ; copy one character
  inc  hl
  jr   __Fill0
__Fill1:pop  de
  jp   (ix)
WordID_1020_Exit:

WordID_1022_Entry: ; *** halt ***
__Halt00:
  halt
  jr   __Halt00
WordID_1022_Exit:

WordID_1023_Entry: ; *** i.fetch ***
  pop  ix
  push  de       ; save current TOS
  ld   e,(hl)      ; get address where the count is.
  inc  hl
  ld   d,(hl)
  ex   de,hl      ; get the count
  ld   e,(hl)
  inc  hl
  ld   d,(hl)
  jp   (ix)
WordID_1023_Exit:

WordID_1035_Entry: ; *** keyboard@ ***
  pop  hl
  call  IO_ScanKeyboard
  push  de
  ld   e,a
  ld   d,0
  jp   (hl)
WordID_1035_Exit:

WordID_1025_Entry: ; *** move ***
  pop  ix
  pop  bc    ; target
  pop  hl    ; source
__Move0:ld   a,d   ; check count zero
  or   e
  jr   z,__Move1
  dec  de    ; dec count
  ld   a,(hl)   ; copy source
  inc  hl
  ld   (bc),a   ; to target
  inc  bc
  jr   __Move0
__Move1:
  pop  de
  jp   (ix)
WordID_1025_Exit:

WordID_1027_Entry: ; *** negate ***
  pop  ix
  xor  a
  ld   l,a
  ld   h,a
  sbc  hl,de
  ex   de,hl
  jp   (ix)
WordID_1027_Exit:

WordID_1028_Entry: ; *** nip ***
  pop  hl
  pop  bc
  jp   (hl)
WordID_1028_Exit:

WordID_1029_Entry: ; *** not ***
  pop  hl
  ld   a,d
  or   e
  ld   de,$0000
  jr   nz,__Not
  dec  de
__Not:
  jp   (hl)
WordID_1029_Exit:

WordID_1030_Entry: ; *** or ***
  pop  hl
  pop  bc
  ld   a,d
  or   b
  ld   d,a
  ld   a,e
  or   c
  ld   e,a
  jp   (hl)
WordID_1030_Exit:

WordID_1031_Entry: ; *** over ***
  pop  ix
  pop  hl      ; 2nd on stack
  push  hl      ; push back
  push  de      ; push TOS
  ex   de,hl     ; 2nd to TOS
  jp   (ix)
WordID_1031_Exit:

WordID_1036_Entry: ; *** rot ***
  pop  ix
  pop  bc    ; 2nd
  pop  hl    ; 3rd
  ex   de,hl   ; 3rd to TOS, TOS->HL
  push  bc    ; push value that was 2nd
  push  hl    ; push old TOS
  jp   (ix)
WordID_1036_Exit:

WordID_1037_Entry: ; *** screen! ***
  pop  ix
  ex   de,hl
  pop  de
  ld   a,e
  call  IO_WriteCharacter
  pop  de
  jp   (ix)
WordID_1037_Exit:

WordID_1041_Entry: ; *** swap ***
  pop  ix
  pop  hl
  push  de
  ex   de,hl
  jp   (ix)
WordID_1041_Exit:

WordID_1043_Entry: ; *** u< ***
  pop  ix
  pop  hl
  xor  a
  sbc  hl,de
  ld   de,0
  jr   nc,__ULess
  dec  de
__ULess:
  jp   (ix)
WordID_1043_Exit:

WordID_1046_Entry: ; *** xor ***
  pop  hl
  pop  bc
  ld   a,d
  xor  b
  ld   d,a
  ld   a,e
  xor  c
  ld   e,a
  jp   (hl)
WordID_1046_Exit:

