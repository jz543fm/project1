#!/bin/bash

sed 'N ; /System\nAdministrator/d' data4.txt

# The sed editor provides the multiline delete dommand (D), which
# deletes only the first line in the pattern space. It removes all
# characters up to and including the newline character: 

echo -e \

sed 'N ; /System\nAdministrator/D' data4.txt

echo -e \

# This sed editor script looks for blank lines and then uses the N command to add the
# next line of text into the pattern space. If the new pattern space contents contain
# the word header, the D command removes the first line in the pattern space. Without 
# the combination of the N and D commands, in would be impossible to remove the first
# blank line without removing all other blank lines.

sed '/^$/{N ; /header/D}' data5.txt


