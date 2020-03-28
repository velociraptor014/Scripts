#!/usr/bin/env bash
# The objective is to let the user writing their own text.
# Five lines, defined by five variables :
one=
two=
three=
four=
five=
file=filename.txt
# At start, variables are empty.
# Now, asking for each lines :
echo "Enter the first line"
read one
echo "Enter the second one"
read two
echo "Enter the third one"
read three
echo "Enter the four one"
read four
echo "Enter the five one"
read five
echo
echo -n "Choose your filename : "
read file
echo
echo "Ok, your text will be written on $file"
echo $one   >>  ./$file
echo $two   >>  ./$file
echo $three >>  ./$file
echo $four  >>  ./$file
echo $five  >>  ./$file
echo "Done ! on file ($file)"
echo "----------------------"
cat ./$file
