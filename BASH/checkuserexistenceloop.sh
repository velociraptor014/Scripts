#!/usr/bin/env bash
name=$USER
tput setaf 25
figlet UserChecker
echo 'Loop Version'
echo
while [[ $name = * ]]; do
  echo -n "Enter a username to check: "
  read name
  if grep $name /etc/passwd > /dev/null
  then
    echo "$name is on this system"
  else
    echo "$name does not exist"
  fi
done
