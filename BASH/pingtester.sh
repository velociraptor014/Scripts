#!/usr/bin/env bash
# Using variables, manipulating Ping command.
local=127.0.0.1
internetdns=8.8.8.8
standardpriv=192.168.1.1
altstd1=172.16.1.1
altstd2=10.0.0.1
altstd3=10.0.1.1
custom=0.0.0.0
ping=
printf '
------------------------------
   PINGv4 TESTING MENU V1.0
------------------------------
Choose an ip address to test :

local         : Ping 127.0.0.1 loopback ip
internetdns   : Ping Google DNS (8.8.8.8) for testing Internet Connection
standardpriv  : Ping Home IP Modem (192.168.1.1) for testing home connection or company with this IP
altstd1       : Ping Alternative private IP (172.16.1.1)
altstd2       : Ping Alternative private IP (10.0.0.1)
altstd3       : Ping Alternative private IP (10.0.1.1)\n
manual        : Ping Custom IP (XX.XX.XX.XX)
'
echo "Make your choice : "
read ping
if [[ $ping = local ]]; then
  ping $local
elif [[ $ping = internetdns ]]; then
  ping $internetdns
elif [[ $ping = standardpriv ]]; then
  ping $standardpriv
elif [[ $ping = altstd1 ]]; then
  ping $altstd1
elif [[ $ping = altstd2 ]]; then
  ping $altstd2
elif [[ $ping = altstd3 ]]; then
  ping $altstd3
elif [[ $ping = manual ]]; then
  echo -n "Enter IP : "
  read custom
  ping $custom 2> /dev/null
else
  echo "Aborting!"
  exit
fi
