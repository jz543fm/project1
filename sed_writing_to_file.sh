#!/bin/bash

# The w command is used to write lines to a file: 
#
# [address]w filename
#
# Filename can be specified as either a relative or absolute pathname, but in either case, the
# person running the sed editor must have write permission for the file. The address can be any
# type of addressing method used in sed, such as a single line number, a text pattern, or range
# of line number or text patterns.

sed '1,2w test.txt' data6.txt

echo -e \

cat test.txt

echo -e \

# Of  course, if you don't want the lines to display on STDOUT, you can use the -n option for the
# sed command.

# The great tool to use if you need to create a data file from a master file on the basis of
# common text values, such as those in a mailing list.

sed -n '/Browncoat/w Browncoats.txt' data11.txt

echo -e \

cat Browncoats.txt
