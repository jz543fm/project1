#!/bin/bash

# The gawk programming language supports the usual cast of structured
# programming commands. 

# The if statement. 
# 
# if (condition)
#	statement1
#
#
# or you can place it on one line
#
# if (condition) statement1

gawk '{if ($1 > 20) print $1}' data4

# If you need to execute multiple statements in the if statement, you
# must enclose them with the braces:
 
echo 

gawk '{
if ($1 > 20)
{
	x=$1*2
	print x
}
}' data4

# The gawk if statement also supports the else clause, allowing you to 
# execute one more statement if the if statement condition fails:

echo 

gawk '{
if ($1 > 20)
	{
		x = $1 * 2
		print x 
	}else
	{
	x = $1 / 2
	print x
}}' data4

echo 

# You can use the else clause on a single line, but you must use a 
# semicolon after the if statement:

# if (condition) statement1; else statement2;
# gawk '{if ($1 > 20) print $1 * 2; else print $1 / 2}' data4


#	While statement:
#
# while (condition)
# {
# 	statements
# }


gawk '{
total = 0
i = 1
while (i < 4)
	{
		total += $i
		i++
	}
	avg = total / 3
	print "Average:", avg
}' data5

echo 

# The gawk programming language supports using the break and continue
# statements while loops, allowing you to jump out of the middle of the 
# loop

gawk '{
total = 0
i = 1
while(i < 4)
	{
		total += $i
		if (i == 2)
			break
			i++
		}
		avg = total / 2
		print "The average of the first two data element is:", avg
	}' data5
echo


#	do-while statement
#
# do
# {
#	statements
# } while (condition)

gawk '{
total = 0
i = 1
do
	{
		total += $i
		i++
	} while (total < 150)
	print total }' data5

echo 

#	For statement
#
# For stement is a common method used in many programming languages for
# looping. The gawk programming language supports the C-style of for loops:
# for (varibale assignment; condition; iteration process)

gawk '{
total = 0
for (i = 1; i < 4; i++){
	total += $i
}
avg = total / 3
print "Average:", avg
}' data5

echo
