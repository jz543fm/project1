#!/bin/bash

# The list command allows you to print both the text and nonprintable chars in a data stream. 
# Any nonprintable characters are shown using either their Octal values, preceded by a \ or the
# standard C-style nomenclature for common nonprintable chars, such as \t for tabs chars:

sed -n 'l' data9.txt

# The $ sign at the End Of The Line indicates the newline char. 
# If you have a datastream that contains an escape char, the list command displays it using
# the octal code if necessary:

echo -e \

sed -n 'l' data10.txt
