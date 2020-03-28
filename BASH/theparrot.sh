#!/usr/bin/env bash
while true
echo -n "Choose a number, I will repeat it after you : "
read magicnumber
do
  if [[ $magicnumber = * ]]; then
    echo "$magicnumber"
    echo -n "Choose another one"
    read magicnumber
    echo "$magicnumber"  
  fi
done
