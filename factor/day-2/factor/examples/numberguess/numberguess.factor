USING: kernel random io math math.parser combinators ;
IN: examples.numberguess

: pick-number ( -- n ) 100 random ;

: ask-for-guess ( -- )
    "What number between 1 and 100 am I thinking of?"
    print
    flush ;

: read-guess ( -- n ) readln string>number ;

: check-guess ( n guess -- )
    {
        { [ 2dup < ] [ 2drop "Lower" print ] }
        { [ 2dup > ] [ 2drop "Higher" print ] }
        [ 2drop "Winner" print ]
    } cond ;

: numberguess ( -- )
    pick-number
    ask-for-guess
    read-guess
    check-guess ;

MAIN: numberguess
