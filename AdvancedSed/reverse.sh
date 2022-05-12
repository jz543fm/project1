#!/bin/bash

# Shell wrapper for sed editor script.
#					To reverse text file lines.

sed -n '{ 1!G ; h ; $p }' $1

# The shell script called reverse uses the sed editor script to reverse text lines in 
# data stream. It uses the $1 shell parameter to retrieve the first parameter from
# the command line, which should be the name of the file to reverse. 
