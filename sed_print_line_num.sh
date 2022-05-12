#!/bin/bash

# The equal sign command prints the current line number for the new line within the data
# stream. Line number are determined by using the newline character in tha data stream. Each
# time a newline character appears in the data stream, the sed editor assumes that it terminates
# a line of text:

sed '=' data1.txt

# The sed editor prints the line number before the actual line of text. The equal sign command
# comes in handy if you are searching for a specific text pattern in data stream:

sed -n '/number 4/{ 
=
p
}' data6.txt

# By using -n option, you can have the sed editor display both the line number and text for the
# line that contains the matching pattern
