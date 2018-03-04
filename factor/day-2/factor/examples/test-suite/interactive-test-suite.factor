USING: tools.test io io.streams.string math.parser splitting ;
USING: kernel namespaces sequences ;
USE: examples.greeter
USE: examples.strings
USE: examples.sequences
IN: examples.test-suite

: ask-for-vocab ( -- str )
    "Which vocabulary do you wish to test?" print flush
    readln ;

: print-test-runs ( str -- )
    [ test ] curry
    with-string-writer
    string-lines [ "Unit Test: " head? ] filter length
    number>string " tests run." append
    print ;

: print-test-failures ( -- )
    test-failures get empty?
    [ "All tests passed." print ] [ :test-failures ] if ;

: test-all-examples ( -- )
    ask-for-vocab
    print-test-runs
    print-test-failures ;

MAIN: test-all-examples
