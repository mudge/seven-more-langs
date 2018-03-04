USING: examples.strings tools.test ;
IN: examples.strings.tests

{ t } [ "racecar" palindrome? ] unit-test
{ f } [ "monkey" palindrome? ] unit-test
