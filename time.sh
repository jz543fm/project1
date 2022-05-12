#!/bin/bash

######################################################
#						     #
# Autor: 	 Juraj Zittnansky		     #
# Date: 	 17/09/2019			     #
# Description:   Updated script for date & time      #
# Usage:         Digital clocks.v2 :-) Intrak        #
# 						     #
######################################################

while true
do	
	echo 
	# %a - means abbreviated weekday f.e (Sun, Sat...)
	# %A - means weekday f.e (Sunday, Monday and so on...)
	# %b - means abbreviated month name (Jan, Dec ...)
	# %e - means day of month 
	# %Y - means year
	# %n - means newline
	# %t - means tab	
	# %I - means hour
	# %M - means minute 
	# %S - means seconds 
	# %N - means nanoseconds 

	date +'Day:%t %A %b/%e %Y %t Time: %t %I:%M:%S %N %P'
	
done|awk '!seen[$0]++'
