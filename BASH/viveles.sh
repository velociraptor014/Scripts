#!/usr/bin/env bash
echo "Hey, tu sais quoi?"
echo "Dit moi un mot et je dirait que j'en suis ravi"
echo
echo -n "Votre mot : "
read word
echo
echo "D'accord..."
echo "Hmmm... (L'homme réfléchissait alors)"
sleep 5
echo "Je suis tout a fait ravis de ce $word"
# Ainsi, ce script montre une simple varable $word
# nous l'utilisons ici en tant que valeur d'entrée
# c'est elle qui sera défini par l'utilisateur
# à la commande "read [variable]". Imaginez faire
# cela dans des conditions, des cases ou même un
# simple bash script ! C'est magique !