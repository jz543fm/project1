#!/bin/bash

# Delete 3rd line

sed '3d' data6.txt

echo -e \

# Delete specific range of lines

sed '2,3d' data6.txt

# Or by using the special EOF char

sed '3,$d' data6.txt

# The pattern-matching feature of the sed editor also applies to the delete command: 

sed '/number 1/d' data6.txt
