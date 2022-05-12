#!/bin/bash

# The gawk programming language provides the array feature using 
# associative arrays.

# Associative arrays are different from numerical arrays in that 
# the index value can be any text string. You do not have to use
# sequential numbers to identify data elements contained in the 
# array. Instead, an associative array consits of a hodge-podge of
# string referencing values. Each index string must be unique and 
# uniquely identifies the data element that's assigned to it. 

# var[index] = element

gawk 'BEGIN{
capital["Illinois"] = "Springfield"
print capital["Illinois"]
}'

echo

# or numeric data element values:

gawk 'BEGIN{
var[1] = 34
var[2] = 3
total = var[1] + var[2]
print total
}'

echo

# Iterating thru array vars:

# for (var in array)
# {
# 	statements
# }

gawk 'BEGIN{
var["a"] = 1
var["g"] = 2
var["m"] = 3
var["u"] = 4
for (test in var)
{
print "Index:",test," - Value:",var[test]
}
}'

echo

# Notice that the index values aren't returned in any particular
# order, but they each reference the appropriate data element
# value. 

# Removing an array index from an associative array requires a 
# special command:

# delete array[index]

# The delete command removes the associative index value and 
# the associated data element value from the array 

gawk 'BEGIN{
var["a"] = 1
var["g"] = 2
for (test in var)
{
print "Index:",test," - Value:",var[test]
}
delete var["g"]
print "---"
for (test in var)
{
print "Index:",test," - Value:",var[test]
}
}'

echo

# After you delete an index value from associative array, you 
# can not retrieve it.



# Regular Expressions:

gawk 'BEGIN{FS=","} /11/{print $1}' data1

# The regular expression /11/ matches records that contain the 
# string 11 anywhere in the data fields. The gawk program matches
# the defined regular expression against all the data fields in
# the record includint the field separator char: 

echo 
gawk 'BEGIN{FS=","} /,d/{print $1}' data1

echo 

# 	The matching operator

# The matching operator allows you to restrict a regular
# expression to a specific data field in the records. The matching
# operator is the tilde symbol (~). You specify the matching 
# operator, along with the data field var, and the regular 
# expression to match:

# $1 ~ /^data/

# The $1 var represents the first data field in the record.
# This expression filters records where the first data field 
# starts with the text data. The following is an example of using
# the matching operator in a gawk program script. 

gawk 'BEGIN{FS=","} $2 ~ /^data2/{print $0}' data1

echo 

# The matching operator compares the 2nd data field w/ the regular
# expression /^data2/, which indicates the string starts with the
# text data2. This is a powerful tool that is commonly used in 
# gawk program scripts to search for specific data elements in 
# a data file: 

gawk -F: '$1 ~ /zittnansky/{print $1,$NF}' /etc/passwd

echo

# This example searches the first data field for the text 
# zittnansky. When it finds the pattern in a record, it prints the
# 1st and last data field values of the record. 

# You can also negate the regular expression match by using the !
# $1 !~ /expression/

#	 Mathematical expressions:
#
# In addition to regular expression, you can also use mathematical
# expressions in the matching pattern. This feature comes in handy
# when matching numerical values in data fields. For exmaple, 
# if you want to display all system users who belong to the root
# users group /group number 0/, you could use this script: 

gawk -F: '$4 == 0{print $1}' /etc/passwd

# The script checks for records where the fourth data field 
# contains the value 0. 


