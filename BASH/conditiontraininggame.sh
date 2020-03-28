#!/usr/bin/env bash
# Start and between
IF=
ELIF=
ELSE=
# Ending
THEN=
FI=
# Starting script
printf '
-------------------------------
  IF, ELIF, ELSE, THEN et FI.
-------------------------------
Ce jeu est en Français et sera
toujours traduit en anglais

This game is in French and will
always be translated to English

-------------------------------
le but est simple
the objective is easy

vous diposez des mots suivants :
you own theses words :

if, fi, then, else, et elif.

Aprés avoir lu le systéme de condition
After reading condition system :

A chaque fois que un mot apparait
sur le terminal, saisir le mot suivant.
For each time of word appear in the
terminal, type the next word.
'
echo
echo -n "Go? [Y/n]"
read go
if [[ $go = [Yy] ]]; then
	echo "Starting !"
	echo
	echo -n "if [[ test ]]; "
	read IF
	if [[ $IF = then ]]; then
		echo "Good !"
		echo "This is an example of code :"
		cat ./cgamesx785qs_data/.ifscript
	elif [[ $IF = * ]]; then
		echo "No, the right answer is 'then'"
		echo "This is an example of code :"
		cat ./cgamesx785qs_data/.ifscript
	fi
	echo
	echo -n "else "
	read ELSE
	if [[ $ELSE = fi ]]; then
		echo "Good !"
		echo "This is an example of code :"
		cat ./cgamesx785qs_data/.elsescript
	elif [[ $ELSE = * ]]; then
		echo "Bad answer, the right answer is 'fi'"
		echo "This is an example of code :"
		cat ./cgamesx785qs_data/.elsescript
	fi
	echo "the last one :"
	echo "if,    tip : Excepting 'then', When I want to do other thing in certain cases"
	read ELIF
	if [[ $ELIF = elif ]]; then
		echo "Good  answer !"
		echo "This is an example of code :"
		cat ./cgamesx785qs_data/.elifscript
	elif [[ $ELIF = * ]]; then
		echo "Bad answer, the right is : elif, used to make another condition after the first one."
		echo "This is an example of code :"
		cat ./cgamesx785qs_data/.elifscript
	fi
elif [[ $go = [Nn] ]];[[ $go = " " ]]; then
	echo "Game aborted !"
	exit
fi
