#!/usr/bin/env bash
# This script translate decimal read values to binary one.
number=0
tput bold;tput setaf 25
figlet "01 to 1" 2>/dev/null
printf '
-------------------------------
  BINARY TO DECIMAL CONVERTER  
-------------------------------
This script will translate your
binary number to decimal one.

Using bc and toilet command
(need to be present on your system to work correctly)
'
echo -n "Enter your value : "
read number
echo "Converting!"
sleep 1
echo "ibase=2;obase=A;$number" | bc | toilet --font wideterm 2>/dev/null