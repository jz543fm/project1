#!/bin/bash

sed 's/<.*>//g' data11.txt

# Notice that the title text is missing, along with the text that was bolded and 
# italicized. The sed editor literally interpreted the script to mean any text between
# the less-than and greater-than signs! Each time the text was enclosed in HTML tags
# such as (<b>first</b>), the sed script removed the entire text.

# The solution to this problem is to have the sed editor ignore any embedded greater
# -than signs between the original tags. To do that, you can create a character class
# that negates the greather-than sign. This changes the script to: 

sed 's/<[^>]*>//g' data11.txt

# That's little better. To clean thing up, you can add a delete command to get rid of
# those pesky blank lines: 

echo \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

sed 's/<[^>]*>//g ; /^$/d' data11.txt
