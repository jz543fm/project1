#!/bin/bash

# About all you can do is control the output field separator char (OFS).
# If you're creating detailed reports, often you need to place data in a 
# specific format and location. The solution is to use the formatted
# printing command -> printf.

# printf "format string", var1, var2 . . . 

# %[modifier] control-letter

# Scientific notation:

gawk 'BEGIN{
x = 10 * 100
printf "The answer is: %e\n", x
}'

echo 

# In addition to the control letters, you can use 3 modifiers for even more
# control over your output. 

# 1.) width: This is a numeric value, that specifies the min width of the
# output field. If the output is shorter, printf pads the space with spaces
# using right justification for the text. If the output is longer than 
# specified width, it overrides the width value.

# 2.) prec: This is a numeric value that specifies the number of digit to 
# the right of the decimal place in floating-point numbers, or the max 
# number of chars displayed in a text string.

# - (minus sign): The minus sign indicates that left justification should
# be used insted of right justification when placing data in the formatted
# space.

gawk 'BEGIN{FS="\n"; RS=""} {print $1,$4}' data2

echo 

gawk 'BEGIN{FS="\n"; RS=""} {printf "%s %s\n", $1, $4}' data2

echo 

# That produces the same output as the print command. The printf command 
# uses the %s format specifier as a placeholder for the two string values.

# This is useful if you need to print multiple thing on the same line, 
# but using separate printf commands:

gawk 'BEGIN{FS=","} {printf "%s ", $1} END{printf "\n"}' data1

echo

# Both printf outputs appear on the same line. To be able to terminate the
# line, the END section prints a single newline character.

# Modifier to format the 1st string value: 

gawk 'BEGIN{FS="\n"; RS=""} {printf "%16s %s\n", $1, $4}' data2

echo

# By adding the 16 modifier value, we force the output for the first string
# to use 16 spaces. By default, the printf command uses right justification
# to place the data in the format space. Just add a minus sign to the 
# modifier: 

gawk 'BEGIN{FS="\n"; RS=""} {printf "%-16s %s\n", $1, $4}' data2

echo

# The printf command also comes in handy when dealing with floating-point
# values. By specifying a format for the variable, you can make the
# output look more uniform: 

gawk '{
total = 0
for (i = 1; i < 4; i++){
	total += $i
}
avg = total / 3
printf "Average: %5.1f\n", avg
}' data5


