		Using variables:

- The gawk programming language supports two different types of variables::

--> Built-in variables
--> User-defined variables 


One type of built in variable available in gawk: the data field variable:

$1 $2 and so on, (numerical position of the data field in the record) 

Data fields are delineated by a field separator character. By default, the field 
separator char is a whitespace char, space or tab. The FS built-in variable
belongs to a group of built-in variables that control how gawk handles fields and 
records in both input data and output data. 

///////////////////////////////////////////////////////////////////////////////////

Variable		Description

FIELDWIDTHS		A space-separated list of nums defining the exact width if each data field 
FS			Input field separator char
RS 			Input record separator char 
OFS 			Output field separator char 
ORS			Output record separator char

///////////////////////////////////////////////////////////////////////////////////

The FS and OFS variables defi ne how your gawk program handles data fi elds in the data
stream. You’ve already seen how to use the FS variable to defi ne what character separates
data fi elds in a record. The OFS variable performs the same function but for the output by using the print command.

By default, gawk sets the OFS variable to a space, so when you use the command:

	print $1,$2,$3

you see the output as:

	field1 field2 field3


