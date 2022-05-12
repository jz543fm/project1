#!/bin/bash

# The multiline print command (P) follows along using the same technique. It prints
# only the first line in a multiline pattern space. This includes all characters up
# to newline character in the pattern space. It is used in much the same way as the
# single-line p command to display text when you use the -n option to supress output
# from the script.

sed -n 'N ; /System\nAdministrator/P' data3.txt

# When the multiline match occurs, the P command prints only the first line in the
# pattern space. The power of the multiline P command comes into play when you combine
# it with the N and D multiline commands.

# The D command has a unique feature in that it forces the sed editor to return to 
# the beginning of the script and repeat the commands on the same pattern space ( It
# does not read a new line of text from the data stream). By including the N command
# in the script, you can effectively single-stem through the pattern space, matching
# multiple lines together.

# Next, by using the P command, you can print the first line, and then using the D 
# command you can delete the firstr line and loop back to the beginning of the script.# When you are back at the script beginning, the N command reads in the next line of
# text and starts the process all over again, this loop continues until you reach 
# the end of the data stream. 

# The pattern space is an active buffer area that holds the text examined by the sed
# editor while it procesess commands. The sed editor utilizies another buffer area
# called hold space. You can use the hold space to temporarily hold lines of text
# while working on other lines in the pattern space. 

# The sed Editor hold space commands nepíšem :-D 
