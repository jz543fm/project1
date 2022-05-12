#!/bin/bash
 
sed -n 's/test/trial/p' data5.txt;

# Printing line, which contains a matching pattern in the substitute command

echo \n

sed 's/test/trial/w test.txt' data5.txt

# The x substitution flag produces the same stdout, but stores the output in the specified file.
