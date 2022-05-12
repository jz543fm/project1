#!/bin/bash

gawk 'BEGIN {print "The data3 File Contents:"} {print $0} END {print "End of File"}' data3.txt
