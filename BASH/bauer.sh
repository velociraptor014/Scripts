#!/usr/bin/env bash
a=  # anything
b=1
c=  # the result
d=  # alternative result (if needed)
echo -n "Jack, Set the bomb time (in seconds) : "
read a # a - b
for ((c = $a; c >= 0; c -= 1))
do
	sleep 1
	clear
	echo $c
done
clear
cat bauerboom
