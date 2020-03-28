#!/usr/bin/env bash
echo "You NEED eSpeak on your system to get this script working."
echo
echo -n "Language in minus (no MAJ) [fr/en/es/it/af]"
read language
echo "Enter a word, and the eSpeak synthetiser will repeat it indefinitely !"
echo 
echo -n "I will repeat this word : "
read word
while true
do
    sleep 0.50
    espeak -v $language "$word"
done