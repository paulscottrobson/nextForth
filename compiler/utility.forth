( *** Utility Routines *** )

:max 2dup - 0<  if nip else drop then ;
:min 2dup - 0<  if drop else nip then ;

:4* 2* 2* ;
:8* 2* 2* 2* ;
:16* 2* 2* 2* 2* ;
:4/ 2/ 2/ ;
:16/ 2/ 2/ 2/ 2/ ;

:__main $FEDC
768 for i c@ 7 and 64 + colour! i c@ i screen! next
$ABCD dump.stack halt ;
