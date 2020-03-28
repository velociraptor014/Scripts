#!/bin/bash
echo "On commence"
echo
echo -n "Entrer la lettre A, B ou C : "
read var
if [[ $var = A ]]
then
	echo A
elif [[ $var = B ]]
then
	echo B
elif [[ $var = C ]]
then
	echo C
elif [[ $var = "" ]]
then
	echo "empty input"
elif [[ $var = * ]]; then
	echo "$var is incorrect"
fi
