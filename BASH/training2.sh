#!/usr/bin/env bash
echo "Training Script. This script use only ECHO command"
# -----------------------------------7
echo -n "What is your name ? "
read name
echo -n "What is you surname ? "
read surname
echo -n "How old are you ?"
read age
echo -n "Where do you live ?"
read live
printf '
Emotions :

------
happy
sad
hungry
tired
angry
stressed
------

'
echo -n "What is your current emotion ?"
read emo
if [[ $emo = happy ]]; then
	emotion=$emo
elif [[ $emo = sad ]]; then
	emotion=$emo
elif [[ $emo = hungry ]]; then
	emotion=$emo
elif [[ $emo = tired ]]; then
	emotion=$emo
elif [[ $emo = angry ]]; then
	emotion=$emo
elif [[ $emo = stressed ]]; then
	emotion=$emo
else
	emotion="without any emotions"
fi
echo "---------"
sleep 1
clear
echo "Your name is $name"
echo "your surname is $surname"
echo "you are $age years old"
echo "Currently, you are $emo"
echo "and you live in $live"
echo
echo