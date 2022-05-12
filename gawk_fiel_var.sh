#!/bin/bash

# $0 Represents the entire line of text
# $1 Represents the first data field in the line of text.
# $2 Represents the second data field in the line of text.
# $n Represents the nth data field in the line of text.

gawk '{print $1}' data2.txt
