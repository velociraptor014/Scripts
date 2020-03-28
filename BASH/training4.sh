#!/usr/bin/env bash
echo "
----------------------
 The additions script
----------------------
"
echo
echo "Enter two value, the script will calculate them."
echo
echo -n "First : "
	read first
echo -n "$first+"
	read second
echo "$first+$second=`echo $(($first+$second))`"
echo "$first plus $second equal to `echo $(($first+$second))`"
echo
echo "Now, the same thing with substracting :"
echo -n "First : "
read first
echo -n "$first-"
read second
echo "$first-$second=`echo $(($first-$second))`"
echo "$first substracted to $second equal to `echo $(($first-$second))`" 
echo
echo "Now, with dividing :"
echo
echo -n "First : "
read first
echo -n "$first/"
read second
echo "$first/$second=`echo $(($first/$second))`"
echo "$first divided $second equal to `echo $(($first/$second))`"
echo
echo "Now, with... Multiplication !"
echo
echo -n "First : "
read first
echo -n "$first*"
read second
echo "$first*$second=`echo $(($first*$second))`"
echo "$first multiplicated by $second equal to `echo $(($first*$second))`"
echo
echo "End of script"