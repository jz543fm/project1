#!/bin/bash

sed '2s/dog/cat/' data1.txt

# Modify 2 lones per the address specified

echo -e \n

sed '2,3s/dog/cat/' data1.txt

# If you want to apply a command toa group a lines of starting at some point within text,
# but continuing to the end of the text, you can use the special address, $

echo -e \n 

sed '2,$s/dog/cat/' data1.txt
