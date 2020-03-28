#!/bin/sh
# This condition allow you to choose between cal or calendar commands.
ACTIVECOMMAND=
clear
echo "Choose your calendar !"
echo "   Simple / Complex   "
read ACTIVECOMMAND
# ---------------------------
if [ $ACTIVECOMMAND = Simple ]; then
  cal
elif [ $ACTIVECOMMAND = Complex ]; then
  calendar
elif [ $ACTIVECOMMAND = Simplex ]; then
  echo "En fait, t'est complétement con."
else
  echo "Eheh, no correspondance."
fi
