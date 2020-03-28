#!/usr/bin/env bash
echo "Training Script. This script use only ECHO command"
# -----------------------------------
num=
printf '
If user send "One", the script answer "Two"
If user send "Two", the script answer "Three"
If user send "Three", the script answer "Four"
If user send "Four", the script answer "Five"
If any other input is sent, the script will answer "What?"

Now, starting script !
'
sleep 1
echo -n "Enter a number in letter [One/Two/Three/Four]:"
read num
if [[ $num = [Oo]ne ]]; then
	echo "Two"
elif [[ $num = [Tt]wo ]]; then
	echo "Three"
elif [[ $num = [Tt]hree ]]; then
	echo "Four"
elif [[ $num = [Ff]our ]]; then
	echo "Five"
else
	echo "What?"
fi