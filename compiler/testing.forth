( *** Simple tests on the core words. Not exhaustive but reasonably reliable *** )

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
(( -1 not 0 not 1 not .h .h .h cr ) 				( not 0 -1 0 )
(( 1 2 3 2dup .h .h .h .h .h cr ) 					( 2dup 3 2 3 2 1 )
(( 1 2 3 2drop .h cr ) 								( 2drop 1 )
(( 42 271 * 271 42 * .h .h cr ) 					( * $2c76 $2c76 )
;

:tests2
													( !@c@c! $1382 $0082 $132A )
(( $1382 $5B07 ! $5B07 @ $5B07 C@ $2A $5B07 C! $5B07 @ .h .h .h cr )
(( $13AA $5B50 ! $0180 $5B50 +! $5B50 @ .h cr ) 	( +! $152A )
(( $8106 2/ dup 2* .h .h cr )						( 2* 2/ $C083 $8106)
(( $57D9 $BCDE or .h cr ) 							( or $FFDF )
(( $57D9 $BCDE and .h cr ) 							( and $14D8 )
(( $57D9 $BCDE xor .h cr ) 							( xor $EB07 )
(( 4 negate -1 negate .h cr ) 						( negate $FFFC 1 )
(( 2 3 < 3 3 < 4 3 < -2 3 < .h .h .h .h cr ) 		( < -1 0 0 -1 )
(( 2 3 > 3 3 > 4 3 > -2 -3 > .h .h .h .h cr ) 		( > -1 -1 0 0 )
(( 2 3 = 3 3 = 4 3 = .h .h .h cr ) 					( = 0 -1 0 )
(( 2 3 u< 2 -3 u< -2 -3 u< .h .h .h cr )   			( u< 0 -1 -1 )
(( $5C08 32 $2A fill ) 								( fill visual check $5C00-$5C2F )
(( $8000 $5C80 32 move ) 							( move visual check $5C80-$5CA0 )
;

:__main $FEDC 6 colour! 42 30 screen! 65 730 screen! keyboard@ $ABCD dump.stack halt ;
