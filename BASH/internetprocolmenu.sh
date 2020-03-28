#!/usr/bin/env bash
ip4="inet "
ip6="inet6 "
eth="ether "
loop="loop "
tput bold
echo '
/----------------------------------\
|  INTERNET PROTOCOL MENU CHOOSER  |
\----------------------------------/
You can show IP Configuration
with this tool. Select your choice :

0) Show INETv6 config
1) Show INETv4 config
2) Show ETH    config
3) Show LOOP   config
'
tput sgr0
echo -n "Make your choice : "
read ask
if [[ $ask = 0 ]]; then
	ip addr show primary | grep "inet6 "
elif [[ $ask = 1 ]]; then
	ip addr show primary | grep "inet "
elif [[ $ask = 2 ]]; then
	ip addr show primary | grep "ether "
elif [[ $ask = 3 ]]; then
	ip addr show primary | grep "loopback"
elif [[ $ask = "" ]];then
	echo "No input detected."
	echo "Aborting!"
	exit
elif [[ $ask = * ]]; then
	echo "Incorrect value detected."
	echo "Aborting!"
	exit
fi