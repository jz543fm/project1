#!/bin/bash

# Similiar to the branch command, the test command (t) is also used to modify the flow
# of the sed editor script. Instead of jumping to a label based on an address, the test
# command jumps to a label based on the outcome of a substitution command.

# If the substitution command succesfully matches and substitutes a pettern, the test
# command branches to the specified label. If the substituion command does not match the
# specified pattern, the test command does not branch. 

# [address]t [label]

# Like the branch command, if you don't specify a label, sed branches to the end of the
# script if the test succeeds. 

sed '{
s/first/matched/
t
s/This is the/No match on/
}' data2.txt

# 1. substitution command looks for the pattern text "first". If it matches the pattern
# in the line, it replaces the text, and the test command jumps over the 2nd substituti
# command. If the 1st substitution command does not match the pattern, the 2nd 
# substitution command is processed. 

echo -e \

echo "This, is, a, test, to, remove, commas. " | sed -n '{
:start
s/,//1p
t start
}'
