#!/bin/bash

gawk 'BEGIN{FS=","} {print $1,$2,$3}' data1

# Print command automatically places the value of the OFS variable
# between each data field in the output. By setting the OFS
# variable, you can use any string to separate data fields in the
# output. 

echo -e \ 

gawk 'BEGIN{FS=","; OFS="-"} {print $1, $2, $3}' data1

echo -e \

gawk 'BEGIN{FS=","; OFS="<-->"} {print $1, $2, $3}' data1

# The FIELDWIDTHS variable allows you to read records without 
# using a field separator char. In some apps, instead of using a 
# field separator char, data is placed in specific columns within
# the record. In these instances, you must set the FIELDWIDTHS
# varible to match the layout of the data in the records.

# After you set FIELDWIDTHS var, gawk ignores the FS and 
# calculates data fields based on the provided field width sizes:

# Here's example using field widths instead of FS chars:

echo -e \

cat data1b

echo -e \

gawk 'BEGIN{FIELDWIDTHS="3 5 2 5"}{print $1,$2,$3,$4}' data1b

# The FIELDWIDTHS var defines four data fields, and gawk parses
# the data record accordingly. The string of numbers in each
# record is split based on the defined field width values.

# By default, gawk sets the RS and ORS vars to the \n char. 
# The default RS var value indicates that each new line of text
# in the input data stream is a new record. 

# The gawk program interprets each blank line as a a record 
# separator. 

echo -e \

gawk 'BEGIN{FS="\n"; RS=""} {print $1,$4}' data2

echo -e \

###############################################################
#		when you reference a gawk var		      #
#		in the script, you don't add 		      #
#		a $ sign before a var name 		      #
###############################################################

# ENVIRON var uses an associative array to retrieve shell 
# shell enviroment vars. An associative array uses text for the 
# array index instead of numeric values. 

gawk '
BEGIN{
print ENVIRON["HOME"]
print ENVIRON["PATH"]
}' 

# The FNR, NF, and NR vars come in handy when you're trying to
# keep track of data fields and records in your gawk program, 
# sometimes you're in a situation where you do not know how
# many data fields are in record. The NF variable allows you to
# specify the last data field in the record without having 
# to know its position:

echo 

gawk 'BEGIN{FS=":"; OFS=":"} {print $1,$NF}' /etc/passwd

# The NF var contains the numerical value of the last data field 
# in the data file. You can use it as a data field variable 
# by placing a dollar sign in front of it.

# The FNR and NR variables are similiar to each other, but they're
# different. The FNR variable contains the number of records 
# processed in the current data file. The NR variable contains the
# total number of records processed. 

echo -e \

gawk 'BEGIN{FS=","}{print $1,"FNR="FNR}' data1 data1

# The gawk program command line defines 2 input files.
# The script prints the 1st data field value and current value of 
# the FNR var. FNR value was reset to 1 when the gawk program
# processed the 2nd data file.

echo -e \

gawk '
BEGIN {FS=","}
{print $1, "FNR="FNR,"NR="NR}
END{print "There were",NR,"records processed!"}' data1 data1

# The FNR var was reset when gawk processed the second data file,
# but NR var maintained its count into the second data file.
# The bottom line is that if you're using only one data file for
# input, the FNR and NR values are the same. If you're using 
# multiple data files for input, the FNR value is reset for each
# data file, and the NR value keeps count throughout all the data
# files.
