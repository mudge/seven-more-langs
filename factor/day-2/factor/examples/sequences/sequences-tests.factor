USING: examples.sequences tools.test math ;
IN: examples.sequences.tests

{ 2 } [ { 1 2 3 4 } [ even? ] find-first ] unit-test
{ f } [ { 2 4 6 } [ odd? ] find-first ] unit-test
