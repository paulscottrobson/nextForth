
:tests1

((	1 2 3 dup .h .h .h .h cr )						( DUP 3 3 2 1)
(( 	1 2 3 drop .h .h cr ) 							( DROP 2 1 )
(( 	1 2 3 nip .h .h cr ) 							( NIP 3 1 )
(( 	1 2 3 swap .h .h .h cr ) 						( SWAP 2 3 1 )
(( 	1 2 3 over .h .h .h .h cr ) 					( OVER 2 3 2 1 )
((  1 2 3 rot .h .h .h cr ) 						( ROT 1 3 2 )
((  0 ?dup 4 ?dup .h .h .h cr ) 					( ?DUP 4 4 0 ) 
(( -1 0= 0 0= 1 0= .h .h .h cr )					( 0= 0 -1 0 )
(( -1 not 0 not 1 not .h .h .h cr )					( not 0 -1 0 )
(( -1 0< 0 0< 1 0< .h .h .h cr ) 					( 0< 0 0 -1 )
(( 42 1- 40 1+ 43 2- 39 2+ .h .h .h .h cr) 			( 12-+ $29 $29 $29 $29 )
(( 4 abs -4 abs .h .h cr )							( abs 4 4 )
(( 42 4 + 42 4 - .h .h cr )							( +- $26 $2E )

-1 not 0 not 1 not 
;

:__main $FEDC tests1 $ABCD dump.stack halt ;

( 2drop 2dup add16 and div2 )
( equals expandmacro fill greater less move multiply negate not )
( or read16 read8 times2 uless write16 write8 xor )
