USING: kernel random io math math.parser combinators ;
IN: examples.numberguess

: numberguess ( -- )
    100 random
    readln string>number
    {
        { [ 2dup < ] [ 2drop "Lower" print ] }
        { [ 2dup > ] [ 2drop "Higher" print ] }
        [ 2drop "Winner" print ]
    } cond ;

MAIN: numberguess
