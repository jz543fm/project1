#!/bin/bash

# The sed editor provides a way to negate an entire section of commands, based on an
# address, an address pattern, or and address range. This allows you to perform a 
# group of commands only on a specific subset within the data stream:

# [address]b [label]

# The address parameter determines which line or lines of data trigger the branch 
# command. The label parameter defines the location to branch to. If the label 
# parameter is not present, the branch command proceeds to the end of the script.

cat data2.txt

echo -e \

sed '{2,3b ; s/This is/Is This/ ; s/line./test?/}' data2.txt

# Instead of going to the end of the script, you can define a label for the branch
# command to jump to. Label start with a colon and can be up to seven chars in lenght.

# :label2

echo -e \

sed '{/first/b jump1 ; s/This is the/No jump on/
:jump1
s/This is the/Jump here on/}' data2.txt

# The branch command specifies that the program should jump to the script line labeled
# jump1 if the matching text "first" appears in the line. If the beanch command pattern
# does not match, the sed editor continues processing commands in the script, including
# the command after the branch lavel. 

# If a line matches the branch pattern, the sed editor branches to the branch label line# Thus, only the last substitution command is executed.

