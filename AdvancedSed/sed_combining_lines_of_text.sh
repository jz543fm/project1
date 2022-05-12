#!/bin/bash

# The sed editor script searches for the line of text that contains the word "first" in it.
# When it finds the line, it uses the N command to combine the next line with that line.
# It then uses uses the substitution command (s) to replace the newline char with a space.
# The result is that two lines in the text file appear as one line in the sed editor output.

sed '/first/{ N ; s/\n/ / }' data2.txt

echo -e \

# The substitution command is looking for the specific 2 word phrase System Administrator in
# the text file. In the single line where the phrase appears, everything is fine, the 
# substitution command can replace the text. But in the situation where the phrase is split 
# between two lines, the substitution command doesn't recognize the matching pattern.

# The N command helps solve this problem.

sed 'N ; s/System Administrator/Desktop User/' data3.txt

echo -e \

sed 'N ; s/System.Administrator/Desktop User/' data3.txt

# By using the N command to combine the next line with the line where the first word is found, you can detect when a line split occurs in the phrase.

# Substitution command uses a wildcard pattern (.) between the 
# word System and the word Administrator to match both the space
# and the newline situation. However, when it matched the newline
# char, it removed it from the string, causing the 2 lines to
# merge into one line. 

# To solve this problem, you can use two substitution commands in
# the sed editor script, one to match the multiline occurrence
# and one to match the single-line occurrence:

echo -e \

sed 'N
s/System\nAdministrator/Desktop\nUser/
s/System Administrator/Desktop User/
' data3.txt
