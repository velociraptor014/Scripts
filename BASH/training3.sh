#!/usr/bin/env bash
echo "Training Script. This script use only ECHO command"
# --------------------------------------------------------------
# In this script, user send five times a number between 1 and 5.
# Results can be :
# ⩇⩇
# ⩇⩇⩇
# ⩇⩇⩇⩇
# ⩇⩇⩇⩇⩇
# ⩇⩇⩇⩇⩇⩇
# if user send 2 3 4 5 6
# 
# In case of inccorect imput into any variable,
# the value will be "invalid"
# --------------------------------------------------------------
echo "
 ⸺⸺⸺⸺⸺⸺⸺⸺⸺⸺⸺⸺⸺⸺⸺⸺⸺⸺
⎮ The Condition Game!⎮
 ⸺⸺⸺⸺⸺⸺⸺⸺⸺⸺⸺⸺⸺⸺⸺⸺⸺⸺

This game will show line of '-' conditionnaly to
your choice of number. Example :

2 ⩇⩇
4 ⩇⩇⩇⩇
5 ⩇⩇⩇⩇⩇
1 ⩇
3 ⩇⩇⩇

If you enter any other thing (like a word) it will show
'Value upper or equal of 6, or invalid input !'

Enter five number, for example :
1
2
3
4
5

By typing enter for each number.

--
"
echo -n "one=	"
read one
echo -n "two=	"
read two
echo -n "three=	"
read three
echo -n "four=	"
read four
echo -n "five=	"
read five
echo --
echo "Choosen numbers : $one $two $three $four $five"
if [[ $one = 1 ]]; then
	one=⩇
elif [[ $one = 2 ]]; then
	one=⩇⩇
elif [[ $one = 3 ]]; then
	one=⩇⩇⩇
elif [[ $one = 4 ]]; then
	one=⩇⩇⩇⩇
elif [[ $one = 5 ]]; then
	one=⩇⩇⩇⩇⩇
else
	one="Value $one is upper or equal of 6, or invalid input !"
fi
if [[ $two = 1 ]]; then
	two=⩇
elif [[ $two = 2 ]]; then
	two=⩇⩇
elif [[ $two = 3 ]]; then
	two=⩇⩇⩇
elif [[ $two = 4 ]]; then
	two=⩇⩇⩇⩇
elif [[ $two = 5 ]]; then
	two=⩇⩇⩇⩇⩇
else
	two="Value $two is upper or equal of 6, or invalid input !"
fi
if [[ $three = 1 ]]; then
	three=⩇
elif [[ $three = 2 ]]; then
	three=⩇⩇
elif [[ $three = 3 ]]; then
	three=⩇⩇⩇
elif [[ $three = 4 ]]; then
	three=⩇⩇⩇⩇
elif [[ $three = 5 ]]; then
	three=⩇⩇⩇⩇⩇
else
	three="Value $three is upper or equal of 6, or invalid input !"
fi
if [[ $four = 1 ]]; then
	four=⩇
elif [[ $four = 2 ]]; then
	four=⩇⩇
elif [[ $four = 3 ]]; then
	four=⩇⩇⩇
elif [[ $four = 4 ]]; then
	four=⩇⩇⩇⩇
elif [[ $four = 5 ]]; then
	four=⩇⩇⩇⩇⩇
else
	four="Value $four is upper or equal of 6, or invalid input !"
fi
if [[ $five = 1 ]]; then
	five=⩇
elif [[ $five = 2 ]]; then
	five=⩇⩇
elif [[ $five = 3 ]]; then
	five=⩇⩇⩇
elif [[ $five = 4 ]]; then
	five=⩇⩇⩇⩇
elif [[ $five = 5 ]]; then
	five=⩇⩇⩇⩇⩇
else
	five="Value $five is upper or equal of 6, or invalid input !"
fi
echo "Now, this is the result :

$one
$two
$three
$four
$five

"