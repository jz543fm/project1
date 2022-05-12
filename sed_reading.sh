#!/bin/bash

# The read (r) command allow you to insert data contained in a separate file.
# 
# [address]r filename
#
# The filename parameter specifies either an absolute or relative pathname for the file that
# contains the data. You can't use a range of addresses for the read command. You can only 
# specify a single number or text pattern address. The sed editor inserts the text from the file
# after the address.

sed '3r data12.txt' data6.txt

echo -e \

# The sed editor inseerts into the data stream all the text lines in the data file. The same
# technique works then using a text pattern address:

sed '/number 2/r data12.txt' data6.txt

# If you want to add text to the end of a data stream, just use the $ sign address symbol:

echo -e \

sed '$r data12.txt' data6.txt
