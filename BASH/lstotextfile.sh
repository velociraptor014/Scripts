#!/usr/bin/env bash
echo "
------------------------
Add ls results to a file
------------------------

You can choose extension and filename
separately.

The file will be stored into a folder
named "LSFILEFOLDER"
"
echo "Choose your filename without extension : "
echo
echo -n "filename="
read fname
echo
echo "Choose your extension : "
echo -n "extension=."
read extf
if [ -f "./LSFILEFOLDER/$fname.$extf" ]
then
	echo "File exist"
	echo Aborting!
	exit
elif [ test ]
then
	mkdir ./LSFILEFOLDER &>> /dev/null
	touch ./LSFILEFOLDER/$fname.$extf &>> /dev/null
	ls ./LSFILEFOLDER/$fname.$extf &>> /dev/null
	echo
	echo "Now, choose a location of ls command to make a result!"
	echo
	echo -n "/"
	read tree
	ls /$tree &>> ./LSFILEFOLDER/$fname.$extf
fi
