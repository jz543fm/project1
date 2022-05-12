#!/bin/bash

echo "The cat sleeps in his hat." | sed 's/cat/"cat"/'

# (.) Wildcard

echo "The cat sleeps in his hat." | sed 's/.at/".at"/g'

# The & symbol is used to represent the matching pattern in the substitution commmand.
# Whatever text matches the pattern defined, you can use the ampersand symbol to recall
# it in the replacement pattern. This lets you manipulate whatever word matches the
# pattern defined. 

echo "The cat sleeps in his hat." | sed 's/.at/"&"/g'

# The ampersand symbol retrieves the entire string that matches the pattern you specify
# in the substitution command.

# The sed editor uses parentheses to define a substring component within the 
# substituion pattern. You can then reference each substring component using a special
# char in the replacement pattern. The replacement char consits of a \ and a number. 
# The number indicates the substring component's position. The sed editor assings the
# first component the char \1, the secong component char \2, and so on. 

echo "The System Administrator manual" | sed '
s/\(System\) Administrator/\1 User/'

echo "That furry cat is pretty" | sed 's/furry \(.at\)/\1/'

echo "That furry hat is pretty" | sed 's/furry \(.at\)/\1/'

# Here is a script that uses substring components to insert a comma in long numbers:

echo "1234567" | sed '{
:start
s/\(.*[0-9]\)\([0-9]\{3\}\)/\1,\2/
t start
}'
