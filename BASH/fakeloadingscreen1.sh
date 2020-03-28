#!/usr/bin/env bash
printf '
-------------------
FAKE LOADING SCREEN
-------------------\n
'
echo "Type 'start' to start loading !"
echo "CTRL+C to stop loading !"
read loading
while true
do
if [[ $loading = start ]]; then
    clear
    echo "---------"
    echo "Loading ."
    echo "---------"
    sleep 1
    clear
    echo "----------"
    echo "Loading .."
    echo "----------"
    sleep 1
    clear
    echo "-----------"
    echo "Loading ..."
    echo "-----------"
    sleep 1
else
  exit
fi
done
