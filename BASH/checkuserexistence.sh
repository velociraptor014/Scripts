#!/bin/sh
name=$USER
tput setaf 25
figlet UserChecker
echo 'One Shot Version'
echo
echo -n "Enter a username to check: "
read name
if grep $name /etc/passwd > /dev/null
then
  echo "$name is on this system"
else
  echo "$name does not exist"
fi
