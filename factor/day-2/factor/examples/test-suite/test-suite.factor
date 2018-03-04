USING: io io.streams.string kernel math.parser namespaces
sequences splitting tools.test ;
USE: examples.greeter
USE: examples.strings
USE: examples.sequences
IN: examples.test-suite

: print-test-runs ( -- )
    [ "examples" test ]
    with-string-writer
    string-lines [ "Unit Test: " head? ] filter length
    number>string " tests run." append
    print ;

: print-test-failures ( -- )
    test-failures get empty?
    [ "All tests passed." print ] [ :test-failures ] if ;

: test-all-examples ( -- )
    print-test-runs
    print-test-failures ;

MAIN: test-all-examples
