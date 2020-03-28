#!/usr/bin/env bash
NONE=`echo "0"`     	# ---
ONE=`echo "1"`     	# --x
TWO=`echo "2"`     	# -w-
THREE=`echo "3"`     # -wx
FOUR=`echo "4"`     	# r--
FIVE=`echo "5"`     	# r-w
SIX=`echo "6"`     	# rw-
SEVEN=`echo 7`     # rwx
N0=`echo "---"`
N1=`echo "--x"`
N2=`echo "-w-"`
N3=`echo "-wx"`
N4=`echo "r--"`
N5=`echo "r-w"`
N6=`echo "rw-"`
N7=`echo "rwx"`
CL=`clear`

var=---
# ------
tput setaf 2;echo "
-----------------------------
 CHMOD Converter Menu Script
-----------------------------
"
tput setaf 5;echo "
This script will show you the conversion of
number into chmod autorisation.

Type between 0 and 7 for conversion to chmod
Type between --- and rwx for conversion to octal
"
echo -n "Your value : "
read var
if [[ $var = 0 ]]; then
	echo $N0
elif [[ $var = 1 ]]; then
	echo $N1
elif [[ $var = 2 ]]; then
	echo $N2
elif [[ $var = 3 ]]; then
	echo $N3
elif [[ $var = 4 ]]; then
	echo $N4
elif [[ $var = 5 ]]; then
	echo $N5
elif [[ $var = 6 ]]; then
	echo $N6
elif [[ $var = 7 ]]; then
	echo $N7
elif [[ $var = --- ]]; then
	echo $NONE
elif [[ $var = --x ]]; then
	echo $ONE
elif [[ $var = -w- ]]; then
	echo $TWO
elif [[ $var = -wx ]]; then
	echo $THREE
elif [[ $var = r-- ]]; then
	echo $FOUR
elif [[ $var = r-w ]]; then
	echo $FIVE
elif [[ $var = rw- ]]; then
	echo $SIX
elif [[ $var = rwx ]]; then
	echo $SEVEN
else
	echo "Naaaa! Ich INVALID !"
fi