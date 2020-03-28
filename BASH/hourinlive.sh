#!/bin/bash
while true
do
  tput setaf 6; tput bold
  date +"%H:%M:%S" | figlet -t
  echo "CTRL+C to stop"
  sleep 1
  clear
done
tput sgr0