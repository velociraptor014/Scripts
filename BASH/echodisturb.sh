#!/bin/sh
# Using pipes and redirection to make the echo disturbing
echo "Je m'appelle Henry"
echo "Je m'appelle Henry" | tr 'Henry' 'Hanry'
echo "Je m'appelle Henry" | tr 'appelle' 'alleppe'
echo "Je m'appelle Henry" | tr 'Je' 'Tu'
echo "Je m'appelle Henry" | tr 'm' 'p'
echo "Je m'appelle Henry" | tr 'appe' 'mapp'
echo "Je m'appelle Henry" | tr "Je m'appelle Henry" "yrneH elleppa'm eJ"

# Pipes can be used to replace characters (or Char).

echo "1" | tr '1' '2' # this will show 2 and not 1.
echo "no" | tr 'no' 'yes' # this will show yes and not no.

# Pipes can interfer with result of commands, for example :
echo "Normal LS"
ls -l
echo "Anormal LS"
ls -l | tr 'drwxrwxrjanvdecnovjunavrmayaug' '00'
echo "The command is : ls -l | tr 'drwxrwxrjanvdecnovjunavrmayaug' '00'"
echo "Or..."
ls -l | echo "Ahah !"
echo 'The Command is : ls -l | echo "Ahah !"'
echo "This make the command LS in bad condition due to pipe."

echo "The Tr command is usefull for maintenancy taskes or for changing a sensible value."
