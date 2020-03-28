#!/usr/bin/env bash
# This script show a menu to choose type of calendar between Simple, Complex and Date.
printf '
----------------------------------
  DATE AND CALENDAR CHOOSER MENU
----------------------------------
Choose between :

current   : calendar of current month
three     : calendar of three month and current one at middle
date      : Show the date of today
hour      : Show the clock (HH:MM:SS)
'
echo -n "Your choice : "
read cli
echo
if [[ $cli = [Cc]urrent ]]
then
  cal
elif [[ $cli = [Tt]hree ]]
then
  cal -3
elif [[ $cli = [Dd]ate ]]
then
  echo "La date d'aujourd'hui : `date +"%A %d %B %Y"`"
elif [[ $cli = [Hh]our ]]
then
  echo "L'heure actuelle : `date +%H:%M:%S`"
fi
