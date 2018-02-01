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

WordID_1005_Entry: ; *** 2+ ***
  inc  de
  inc  de
  ret
WordID_1005_Exit:

WordID_1004_Entry: ; *** 2- ***
  dec  de
  dec  de
  ret
WordID_1004_Exit:

WordID_1006_Entry: ; *** and ***
  pop  hl
  pop  bc
  ld   a,d
  and  b
  ld   d,a
  ld   a,e
  and  c
  ld   e,a
  jp   (hl)
WordID_1006_Exit:

WordID_1007_Entry: ; *** drop ***
  pop  hl
  pop  de
  jp   (hl)
WordID_1007_Exit:

WordID_1008_Entry: ; *** dup ***
  pop  hl
  push  de
  jp   (hl)
WordID_1008_Exit:

WordID_1009_Entry: ; *** halt ***
__Halt00:
  halt
  jr   __Halt00
WordID_1009_Exit:

WordID_1010_Entry: ; *** not ***
  pop  hl
  ld   a,d
  cpl
  ld   d,a
  ld   a,e
  cpl
  ld   e,a
  jp   (hl)
WordID_1010_Exit:

WordID_1011_Entry: ; *** or ***
  pop  hl
  pop  bc
  ld   a,d
  or   b
  ld   d,a
  ld   a,e
  or   c
  ld   e,a
  jp   (hl)
WordID_1011_Exit:

WordID_1012_Entry: ; *** over ***
  pop  ix
  pop  hl      ; 2nd on stack
  push  hl      ; push back
  push  de      ; push TOS
  ex   de,hl
  jp   (ix)
WordID_1012_Exit:

WordID_1013_Entry: ; *** swap ***
  pop  ix
  pop  hl
  push  de
  ex   de,hl
  jp   (ix)
WordID_1013_Exit:

WordID_1014_Entry: ; *** xor ***
  pop  hl
  pop  bc
  ld   a,d
  xor  b
  ld   d,a
  ld   a,e
  xor  c
  ld   e,a
  jp   (hl)
WordID_1014_Exit:

