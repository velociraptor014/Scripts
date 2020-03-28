#!/usr/bin/env bash
# This script translate decimal read values to binary one.
number=0
tput setaf 25
figlet "1 to 01" 2>/dev/null
tput sgr0
printf '
-------------------------------
  DECIMAL TO BINARY CONVERTER  
-------------------------------
This script will translate your
decimal number to binary one.

Using bc and toilet command
(need to be present on your system to work)
'
echo -n "Enter your value : "
read number
echo "Converting!"
sleep 1
echo "obase=2;$number" | bc | toilet --font wideterm 2>/dev/null