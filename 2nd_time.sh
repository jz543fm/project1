#!/bin/bash

while true
do
        echo 
        # %a - means abbreviated weekday f.e (Sun, Sat...)
        # %b - means abbreviated month name (Jan, Dec ...)
        # %e - means day of month 
        # %Y - means year
        # %n - 
        # %I

        date +'%a %b %e %Y %n %I:%M:%S %N %p'


done|awk '!seen[$0]++'

