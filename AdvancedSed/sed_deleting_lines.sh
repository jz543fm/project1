#!/bin/bash

# Deleting consecutive blank lines

# The key to removing consecutive blank lines is to create an address range that 
# includes a non-blank line. If the sed editor comes accross this range, it should not
# delete the line. However, for lines that do not match that range (2 or + lines in a 
# row) it should delete lines 

# /./,/^ $/!d

# The range is /./ to / ^ $/. The start address in the range matches any line that 
# contains at least one char. The end address in the range matches a blank line. Lines
# within this range are not deleted. 

sed '/./,/^$/!d' data8.txt

# The script uses an address range to determine what lines are deleted. The range
# starts with a line that contains a char and continues to the end of the data stream. 
# Any line within this range is not deleted from the output. This means that any line
# before the first line that contain a char are deleted.

echo -----------------

sed '/./,$!d' data9.txt
