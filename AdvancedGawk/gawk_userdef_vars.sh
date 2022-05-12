#!/bin/bash

# gawk allows you to define your own vars for use within the 
# program code. A gawk user-defined var name can be any number of
# letters, digits, and uderscores, but not a digit. 

# gawk vars are case sensitive!

# Assigning vars in scripts 

gawk '
BEGIN{
testing="This is a test"
print testing
}'

echo -e \

# gawk vars can hold either numeric or text values:

gawk '
BEGIN{
testing="This is a test"
print testing
testing=420
print testing
}'

echo -e \

# Assignment statements can also include math algorithms to handle
# numeric values: 

gawk 'BEGIN{x=4; x= x * 2 + 3; print x}'

echo -e \


#	 Assigning vars on the command line:
#
# You can also use the gawk command line to assign values to 
# variables for the gawk program. This allows you to set values
# outside of normal code, changing values on the fly

gawk -f script1 n=2 data1

echo -e \

gawk -f script1 n=3 data1

echo -e \ 

# There's one problem w/ using command line parameters to define
# var values. When you set the var, the value is not available 
# in the BEGIN secton of the code: 

gawk -f script2 n=3 data1

# You can solve this using -v command line parameter.
# This allows you to to specify vars that are set before the 
# BEGIN section of code. The -v command line parameter must be 
# placed before the script code in the command line.

echo -e \

gawk -v n=3 -f script2 data1
