#!/bin/bash

sed '/^$/d' data1.txt

echo -e \

	# Remove only second line :-)

sed '/header/{n ; d}' data1.txt
