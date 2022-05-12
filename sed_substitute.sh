#!/bin/bash

sed 's/test/trial/' data4.txt

# By the default, it replaces only the first occurence in each line. 
# To work on different occurrences of the text, you must use a substitution flag:
# s/pattern/replacement/flags 
# 4 types of substitution flags are available: 
# 
# A number indicating the pattern occurence for which new text should be substituted.
# g, indicating that new text should be substituted for all occurences of the existing text
# p, indigating that the contents of the original line should be printed 
# w file, which means to write the results of the subsitution to a file 

echo \n 

sed 's/test/trial/2' data4.txt

echo \n

sed 's/test/trial/g' data4.txt
