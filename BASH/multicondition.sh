#!/usr/bin/env bash
echo "This script is designed for demonstrating variable into conditions"
echo "------------------------------------------------------------------"
echo "You can enter any other words than asked for seeing the behavior !"
echo
echo "In this script, you will set the variable by READ command :"
echo
echo -n "Enter 'hello' : "
read hello
echo "The variable \$hello is now set to $hello"
if [[ $hello = hello ]]; then
  echo "The value is $hello and correspond to the asked one"
else
  echo "The value is $hello and do not correspond to the asked one"
fi
echo
echo -n "Another example, enter anything you want excepting 'world' :"
read world
echo
echo "Now, the \$world variable is set to $world"
echo
if [[ $world = world ]]; then
  echo "You have entered '$world' and is the excepting one !"
elif [[ $world = * ]]; then
  echo "You have entered '$world' and it's OK"
fi
echo
echo "Script Ended."
