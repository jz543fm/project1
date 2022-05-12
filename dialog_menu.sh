#!/bin/bash

# using dialog to create a menu

# Script uses while loop with a constant true value = endless loop, after every function, script returns to displaying menu

# Menu dialog includes a Cancel button, so the script checks the exit status of the dialog command in case the use presses 
# the cancel button to exit. After cancel button then is called clear function to clear previous screen.

# Script uses the mktemp command to create 2 temporary files for holding data for the dialog commands.

# The first one, $temp, is used to hold the output of the df, whoseon a meminfo commands, so they can be displayed in the 
# textbox dialog. The 2nd temporary file, $temp2, is used to hold the selection value from the main dialog.



temp=$(mktemp -t test.XXXXXX)
temp2=$(mktemp -t test2.XXXXXX)

function diskspace {
	df -k > $temp
	dialog --textbox $temp 20 60
}

function whoseon {
	who > $temp
	dialog --textbox $temp 20 50
}

function memusage {
	cat /proc/meminfo > $temp
	dialog --textbox $temp 20 50
}

while [ 1 ]

do
	dialog --menu "Sys Admin Menu" 20 30 10 1 "Display disk space" 2 "Display users" 3 "Display memory usage" 0 "Exit" 2> $temp2
	if [ $? -eq 1 ]
	then
		clear
		break
		
	fi

	selection=$(cat $temp2)

	case $selection in
		1)
			diskspace ;;
		2)
			whoseon ;;
		3)
			memusage ;;
		0)
			break ;;

		*)
			dialog --msgbox "Sorry, invalid selection" 10 30

		esac
	done

	rm -f $temp 2> /dev/null

	rm -f $temp2 2> /dev/null
