# This is not a script

Les conditions dans un script shell type BASH et SH (qui ne sont pas pareil !) permettent de faire un choix en fonction d'un résultat de variable (par exemple, la réponse de l'utilisateur)

Ainsi, avec la condition suivante :


------------------------------------
echo -n "Choose between A, B or C :"
read answer
if [[ $answer = A ]]
then
	echo "Is A letter"
elif [[ $answer = B ]]
then
	echo "Is B letter"
elif [[ $answer = C ]]
then
	echo "Is C letter"
fi
------------------------------------

La condition va alors :

Répondre "Is A letter" si l'utilisateur insère "A" "
Répondre "Is B letter" si l'utilisateur insère "B" "
Répondre "Is C letter" si l'utilisateur insère "C" "

Ainsi, imaginez que cette condition génére autre chose que des commandes echo, vous pourrez ainsi afficher des menus, installer des paquets, faire des pings, faire des logs, et plus encore !


------------------------------------------------------------------
La différence entre BASH et SH est simple au niveau des conditions

En effet, le SH (Shell) étant plus vieux que le BASH (Bourne Again Shell) il existe une différence de scripting au niveau des conditions.

En #!/bin/sh, on mettra alors :

if [ conditions ]
then

En #!/bin/bash, on mettra alors :

if [[ conditions ]]
then

Le SH ne supporte pas les double "[]" par exemple.

------------------------------------------------------------------
Le then, en fonction de votre Shell (bash, zsh...) le then peut se
positionner de deux façon :

if [[ conditions ]]; then

et

if [[ conditions ]]
then

Il est libre de choisir entre l'un et l'autre, en prenant en
compte que le deuxiéme est plus sûr.

