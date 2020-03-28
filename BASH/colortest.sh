#!/bin/bash
# couleurs Â© Damien Clauzel <Damien@Clauzel.eu>
# sous licence CeCILL2, http://www.cecill.info

# usage: $ couleurs 
# description: affiche sur la sortie standard les diffÃ©rentes
# couleurs et modes du terminal et du shell

# v1.0 jeu jun 9 21:48:00 CEST 2005
# version initiale

echo "Les couleurs d'avant-plan vont de 30 Ã  37"
echo "Les couleurs d'arriÃ¨re-plan vont de 40 Ã  37"
echo "Les styles vont de 0 Ã  8"
echo -e "
\e[7mCouleurs\e[0m
\e[4m plain \e[0m \e[4m bold \e[0m
Black 30 Dark Gray 30
Blue 34 Light Blue 34
Green 32 Light Green 32
Cyan 36 Light Cyan 36
Red 31 Light Red 31
Purple 35 Light Purple 35
Brown 33 Yellow 33
Light Gray 37 White 37

\e[7mStyles\e[0m
0: default, revient au style initial
1: bold, la couleur varie lÃ©gÃ¨rement du style 'plain'; il n'existe pas de 'bold' pour la couleur d'arriÃ¨re plan
2: dim
3: italic
4: underline
5: blink, quasiment jamais implÃ©mentÃ© dans les consoles virtuelles
6: inconnu
7: inverse
8: concealed, le texte n'est pas affichÃ©, pratique pour les mots de passe
"

echo " _ _ _ 40_ _ _ _ _ 41_ _ _ _ _ 42_ _ _ _ _ 43_ _ _ _ _ 44_ _ _ _ _ 45_ _ _ _ _ 46_ _ _ _ _ 47_ _ "

for((foreground=30;foreground<=37;foreground++)) do

# bold	
echo -ne " "
for((background=40;background<=47;background++)) do
echo -ne "\e[$foreground;$background;1m bold \e[0m "
done
echo

# dim	
echo -ne "$foreground: "
for((background=40;background<=47;background++)) do
echo -ne "\e[$foreground;$background;2m plain \e[0m "
done
echo

# italic	
echo -ne " "
for((background=40;background<=47;background++)) do
echo -ne "\e[$foreground;$background;3m italic \e[0m "
done
echo

# underlined	
echo -ne " "
for((background=40;background<=47;background++)) do
echo -ne "\e[$foreground;$background;4m underline \e[0m "
done
echo

# blink	
echo -ne " "
for((background=40;background<=47;background++)) do
echo -ne "\e[$foreground;$background;5m blink \e[0m "
done
echo

# inverse	
echo -ne " "
for((background=40;background<=47;background++)) do
echo -ne "\e[$foreground;$background;7m inverse \e[0m "
done
echo

# concealed	
echo -ne " "
for((background=40;background<=47;background++)) do
echo -ne "\e[$foreground;$background;8m concealed \e[0m "
done
echo

done
