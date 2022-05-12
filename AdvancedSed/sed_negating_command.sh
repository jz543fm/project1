#!/bin/bash

# The exclamation mark command (!) is used to negate a command. 

sed -n '/header/!p' data2.txt

# The normal p command would have printed only the line in the data2 file that
# contained the word header. By adding the exclamation mark, the opposite happens,
# all lines in the file are printed except that one that contained the word header.

# Using the exclamation mark comes in handy in several applications. Recall that
# earlier in the chapeter "Navigating the next command" section showed a situation
# where a sed editor command would not operate on the last line of text in the data
# stream because there was not a line after it. You can use the exclamation point 
# to fin that problem:

echo -e \

sed 'N;
s/System\nAdministrator/Desktop\nUser/
s/System Administrator/Desktop User/
' data4.txt

echo -e \

sed '$!N;
s/System\nAdministrator/Desktop\nUser/
s/System Administrator/Desktop User/
' data4.txt

# This example shows the exclamation mark used with the N command, along with the $
# sign special address. The $ sign represents the last line of text in the data stream
# so when the sed editor reaches the last line, it does not execute the N command. 
# However for all other lines, it does execute the command.

# Using this technique, you can reverse the order of text lines in a data stream. 
# To reverse the order of the lines as they appear in the text stream, you need
# to do some fancy footwork using the hold space:

# The pattern you need to work with goes like this:
#
# 1.) Place a line in the pattern space 
# 2.) Place the line from the pattern space to the hold space.
# 3.) Put the next line of text in the pattern space. 
# 4.) Append the hold space to the pattern space.
# 5.) Place everything in the pattern space into the hold space.
# 6.) Repeat steps 3 through 5 until you've put all the lines in reverse order in the
# hold space
# 7.) Retrieve the lines and print them.

echo -e \

cat data2.txt

echo -e \

sed -n '{1!G ; h ; $p }' data2.txt
