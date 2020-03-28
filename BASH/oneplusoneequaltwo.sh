#!/usr/bin/env bash
echo "Hey, this is a little calcul with 2 try :"
echo -n "1+1="
read result
if [[ $result = 2 ]]; then
	echo "Good ! It is right !"
elif [[ $result = * ]]; then
	echo "Wrong answer !"
	echo "Retry !"
	echo -n "1+1="
	read result
	if [[ $result = 2 ]]; then
		echo "Yes ! It is right !"
	elif [[ $result = * ]]; then
		echo "Ooh nooo... Is wrong !"
		echo "Retry !"
		echo -n "1+1="
		read result
		if [[ $result = 2 ]]; then
			echo "Yes ! IS RIGHT !!!!"
		elif [[ $result = * ]]; then
			echo "Ahahahahha nooo !!! Loooser !"
		fi
	fi
fi
