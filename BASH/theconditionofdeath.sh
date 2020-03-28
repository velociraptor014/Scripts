#!/bin/sh
echo "Ce script étudie l'usage des conditions IF-FI"
echo "---------------------------------------------"
echo "Alors, nous allons prendre un exemple :"
# -------------------------------------------------
echo "Choisissez entre 'on', 'off' et 'middle'"
read DEATH
echo "You have choosen $DEATH"
echo PLEASE
sleep 1
echo WAIT
sleep 3
# - - - - - - - - - - - - - - - - - - - - - - - - -
if [ $DEATH = off ]; then
  echo "Il est mort"
elif [ $DEATH = on ]; then
  echo "Il est vivant"
elif [ $DEATH = middle ]; then
  echo "Il est quelque chose mais je ne sais pas quoi !"
else
  echo "Réponse incorrectesh"
fi
