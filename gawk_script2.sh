#!/bin/bash 

gawk -F: -f script2.gawk /etc/passwd
