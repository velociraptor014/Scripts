#!/usr/bin/env bash
printf '
Dialogue entre deux personne
'
echo "Type 'start'"
read start
if [[ $start = start ]]; then
	read dialog
	echo "Bonjour"
	read dialog
	echo "Oui et toi?"
	exit
else
	echo
	exit
fi