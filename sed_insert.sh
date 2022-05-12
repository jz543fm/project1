#!/bin/bash

# Insert (i) adds a new line before the specified line
# Append (a) adds a new line after the specified file 

echo "Test Line 2" | sed 'i\Test Line 1'

echo -e \

echo "Test Line 2" | sed 'a\Test Line 1'

echo -e \

# Example of inserting a new line before line 3 in the data stream. 

sed '3i\This is a inserted line.' data6.txt 

# Example of appending a new line after line 3 in the data stream. 

echo -e \

sed '3a\This is an appended line.' data6.txt

# If you have a multiline data stream, and you want to append a new line of text to the end
# of a data stream, just use $ sign, which represents the last line of data.

echo -e \

sed '$a\This is a new line of text.' data6.txt

echo -e \

# To insert or append more than one line of text, you must use \ on each line of new text
# until you reach the last text line where you want to insert or append text.

sed '1i\This is one line of new text.\This is another line of new text.' data6.txt

