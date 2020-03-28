#!/usr/bin/env bash
number=1
if [[ -eq * ]]; then
	limit=$*
elif [[ -z ${*+x} ]]; then
	limit=1000
fi
echo "
███████████████████████████████
█This script will add your    █
█custom value to the variable █
█\$number, enter your value    █ 
█                             █
█it will echo result to you ! █
█                             █
█Starting value : 1 (number=1)█
███████████████████████████████

Limit set : $limit
"
echo $number
while true
do
echo -n "Your value : "
read add
if [[ "$add" =~ [0-9] ]]; then
	let "number += add"
	echo $number
	if [[ $number -ge $limit ]]; then
		echo "Limit reached! (set to $limit)"
		echo Aborted
		exit
	fi
elif [[ $add = [Ee]xit ]]; then
	exit
elif [[ $add = EXIT ]]; then
	exit
elif [[ $add = [Qq]uit ]]; then
	exit
elif [[ $add = QUIT ]]; then
	exit
else
	echo "Numbers only"
	exit
fi
done
