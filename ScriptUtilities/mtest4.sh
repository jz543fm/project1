#!/bin/bash
# redirecting SQL output to a variable
MYSQL=$(which mysql)
dbs=$($MYSQL mytest -u test -Bse 'show databases')
for db in $dbs
do
echo $db
done
