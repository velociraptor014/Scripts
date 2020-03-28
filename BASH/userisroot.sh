#!/usr/bin/env bash
if [ $USER = root ]; then # Check for USER=root
  echo "You are root"
else
  echo "You are not root !"
fi
# ------------------------------------------------------------------------ #
# This script say "You are not root" when the variable $USER is not "root" #
# If the script see "root" in $USER variable, it will say "You are root"-- #
# In the case of nothing is into the variable, it will say a joke.-------- #
# ------------------------------------------------------------------------ #
