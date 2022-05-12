#!/bin/bash

dialog --title "Please answer" --yesno "Is this thing on?" 10 20
echo $?
clear
# If Yes button is selected, exit status is 1
# If No button is seleccted, exit status is 0 
