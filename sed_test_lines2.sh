#!/bin/bash

sed -e 's/brown/green/; s/dog/cat/' data1.txt

# To execute more than 1 command from the sed CLI, -e, option
# Command must be separated with a semicolon, there are not allowed any spaces between the end of the command and the semicolon
