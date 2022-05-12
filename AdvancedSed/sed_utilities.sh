#!/bin/bash

# Spacing with double lines, inserting blank lines 

sed 'G' data2.txt

# G command simply appends the contents of the hold space to the current pattern space 
# contents. When you start the sed editor, the hold space contains an empty line. By 
# appennding that to an existing line, you create a blank line after the existing line. 

echo ----------

# The negation does not add blank line on the last line. 

sed '$!G' data2.txt

echo ----------

# Double spacing 

sed '$!G' data6.txt

# This pattern uses the start line tag /the caret/ and the end line tag $

echo -----------

sed '/^$/d ; $!G' data6.txt

echo --------

# Numbering lines in file

sed '=' data2.txt

echo -e \

sed '=' data2.txt | sed 'N; s/\n/ /'

# Displaying last line of data

echo -e \

sed -n '$p' data2.txt

echo -e \

# How you can use the dollar sign symbol to display a set number of lines at the end of
# the data strem? The answer is to create a rolling window.

# Rolling window is a common way to examine blocks of text lines in the pattern space 
# by combining them using the N command. The N command appends the next line of text
# to the text already in the pattern space. After you have a block of 10 text lines in
# the pattern space, you can check to see if you're at the end of the data stream using 
# $. If you're not at the end, continue adding more lines to the pattern space, while 
# removing the original lines /the D command, which deletes the first line in the 
# pattern space

# By looping thru the N and D commands, you add new lines to the block of lines in
# pattern space while removing old lines. The branch command is the perfect fit for the
# loop. To end the loop, just identify the last line and use the Q command to quit. 

sed '{
:start
$q ; N ; 11,$D
b start
}' data7.txt

# The script first checks whether the line is the last line in the data stream. If it is
# the quit command stops the loop, the N command appends the next line to the current 
# line in the pattern space. The 11,$D command deletes the first line in the pattern
# space if the current line is after line 10. This creates the sliding window effect in
# the pattern space. Thus, the sed program script displays only the last 10 lines of
# the data7.txt
