#!/usr/bin/env bash
a1=
a2=
ask=
#------------------
echo "
--------------------------------------------
      RC file editor - Ce script ecrit
    un alias choisi sur votre fichier RC
          (choisi ou autodetecté)

   L'accés root n'est pas obligatoire sur
          vos fichiers personnels.
--------------------------------------------

Séléctionner un mode :

0) Abort
1) Write on ~/.zshrc (at the end, after OMZ config)
2) Write on ~/.bashrc
3) Write on custom file in ~/
4) Write on custom file and custom location

5) Autodetection and writing on rc of shell.

** ~/ = Répertoire utilisateur actuel ($USER:$UID)

"
echo
echo -n "[0/1/2/3/4/5/6]"
read ask
echo "Mode choisi : mode [$ask]"
echo
echo "Entrer la commande à créer (si existance = override)"
echo -n "Saisie : "
read a1
echo
echo "Entrer la commande qui sera executée à l'usage de ($a1) :"
echo "Ne faite aucun espaces hormis entre les commandes, par exemple evitez"
echo "echo \"Your name is\"" ; echo "Cause it will does'nt work anymore!"
echo
echo -n "Saisie : "
read a2
echo
echo "l'alias ressemblera alors à : "
echo
echo "alias \"$a1\"=\"$a2\""
echo
if [[ $ask = 0 ]]; then
    echo "Aborting !"
    exit 1
elif [[ $ask = 1 ]]; then
    echo "alias \"$a1\"=\"$a2\"" >> ~/.zshrc
elif [[ $ask = 2 ]]; then
    echo "alias \"$a1\"=\"$a2\"" >> ~/.bashrc
elif [[ $ask = 3 ]]; then
    echo -n "Nom du fichier dans ~/.. ? "
    read c1
    echo "alias \"$a1\"=\"$a2\"" >> ~/$c1
elif [[ $ask = 4 ]]; then
    echo -n "Nom du fichier et localisation '/../../ or ./..' ? "
    read c2
    echo "alias \"$a1\"=\"$a2\"" >> $c2
elif [[ $ask = 5 ]]; then
    if grep `echo $SHELL` "zsh"; then
        echo "alias \"$a1\"=\"$a2\"" >> ~/.zshrc
        exit 0
    elif grep `echo $SHELL` "bash"; then
        echo "alias \"$a1\"=\"$a2\"" >> ~/.bashrc
        exit 0
    elif grep `echo $SHELL` "csh"; then
        echo "On CSH, you can create alias manually but not automatically !"
        exit 1
    elif grep `echo $SHELL` "ksh"; then
        echo "Not implemented yet !"
        echo "Come back later."
        exit 1
    fi
elif [[ $ask = * ]]; then
    echo "Input Invalid !"
    echo "Aborting!"
    exit 1
fi