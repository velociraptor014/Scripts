------------------------------------------------------
Liste de traitement des arguments dans un script shell
------------------------------------------------------

Dans un script, la variable par défaut est $0 (script). Donc :

$0 : le script lui-même (le fichier .sh/.bash)
$1 : le 1er argument
$2 : le 2eme argument
$3 : le 3eme argument
$4 : le 4eme argument
$* : tout les arguments détectés **

** Si ont utiliser le "$*" il faudra prendre en considération que TOUT les arguments seront pris en compte par la variable tel que :
*=1 2 3 4 5 6 7 8 9 ......
qui dans le cas d'un script multi commande n'est pas adapté.

------------------------------------------------------
Ces variables peuvent, comme tout autres variables, être modifiées dans des cas spéciaux. Comme pour fixer un probléme ou pour adapter l'argument.

Par exemple, si :

/etc/passwd

doit être

"/etc/passwd"

alors on pourra ajouter les élements de syntaxe si celle ci est nécessaire en ajoutant la syntaxe à la variable :

Pour l'arg1 ($1):

l'argument : /etc/
la variable: $1
l'initiale : 1=/etc/ (a ne pas initialiser, car défini au lancement)
la variable de modification : $modif / modif="
la modifiée: 1=$m/etc/$m / qui donnera alors 1="/etc" et sera adapté aux commandes suivantes.