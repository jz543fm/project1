#!/bin/bash

# The gawk programming language provides quite a few built-in functions
# that perform common mathematical, string, and even time functions. 
# You can utilize these functions in your gawk program to help cut down
# on the coding requirements in your script. 

# The gawk Mathematical functions

gawk 'BEGIN{x=exp(100); print x}'

echo 

# ■ and(v1, v2): Performs a bitwise AND of values v1 and v2
# ■ compl(val): Performs the bitwise complement of val
# ■ lshift(val, count): Shifts the value val count number of bits left
# ■ or(v1, v2): Performs a bitwise OR of values v1 and v2
# ■ rshift(val, count): Shifts the value val count number of bits right
# ■ xor(v1, v2): Performs a bitwise XOR of values v1 and v2

# The gawk string functions

gawk 'BEGIN{x = "testing"; print toupper(x); print length(x) }'

echo 

# However, some string functions can get pretty complicated. The asort 
# and asorti functions are new gawk functions that allow you to sort an
# array var based on either the data element values (asort) or the 
# index values (asorti).

# Asort:

gawk 'BEGIN{
var["a"] = 1
var["g"] = 2
var["m"] = 3
var["u"] = 4
asort(var, test)
for (i in test)

print "Index:",i," - value:",test[i]
}'

echo

# The split function is a great way to push data fi elds into an array for
# further processing:

gawk 'BEGIN{ FS=","}{
split($0, var)
print var[1], var[5]
}' data1

echo

# The new array uses sequential numbers for the array index, starting with
# index value 1 containing the first data field.


# Time functions:

# The system functions are often used when working with log files that
# contain dates that you need to compare. By converting the text 
# representation of a date to the epoch time (the number of second since 
# modnight, January 1, 1970), you can easily compare dates.

gawk 'BEGIN{
date = systime()
day = strftime("%A, %B %d, %Y", date)
print day
}'


