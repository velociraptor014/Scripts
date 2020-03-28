#!/usr/bin/env bash
question='Please enter your choice'
options=("Option 1" "Option 2" "Option 3" "Quit")
select opt in "${options[@]}"
do
  case $opt in
    "Option 1")
      echo "Chosen 1 !"
      ;;
    "Option 2")
      echo "Chosen 2 !"
      ;;
    "Option 3")
      echo "Chosen 3 !"
      ;;
    "Quit")
      break
      ;;
    *) echo "Invalid"
  esac
done
