#!/bin/bash

# sed '{
# :start
# / ^ \n*$/{$d; N; b start }
# }'

# There are braces within the normal script braces. This allows you to group of commands
# together within the overall command script. The group of commands applies to the 
# specified address pattern. The address pattern matches any line that contains only
# a newline char. When one is found, if it is the last line, the delete command deletes
# it. If it is not the last line, the N command appends the next line to it, and the 
# branch command loops to the beginning to start over. 

sed '{
:start
/^\n*$/{$d ; N ; b start }
}' data10.txt

# The script successfully removed the blank lines from the end of the text file.
