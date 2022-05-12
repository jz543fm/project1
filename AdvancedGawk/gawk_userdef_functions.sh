#!/bin/bash

# Defining a function
#
# function name([variables]){
# 	statements
# }

gawk '
function myprint(){
	printf "%-16s - %s\n", $1, $4
}
BEGIN{FS="\n"; RS=""}
{
	myprint()
}' data2

echo 

# Creating a function library. Gawk provides a way for you to combine your
# functions into a signle library fle that you can use in all your gawk
# programming.

# The funclib file contains 3 functions definitions. To use them, you need
# to use -f command line parameter. Unfortunately, you can not combine the
# -f command line parameter with an inline gawk script, but you can use 
# multiple -f parameters on the same command line. 

# Thus, to use your library, just create a file that contains your gawk 
# program, and specify both the library file and your program file on 
# the command line: 

gawk -f funclib -f script4 data2
