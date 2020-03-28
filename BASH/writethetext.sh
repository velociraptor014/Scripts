#!/usr/bin/env bash
# The objective is to let the user writing their own text.
# Five lines, defined by five variables :
one=
two=
three=
four=
five=
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
echo "Ok, you have entered :"
echo $one
echo $two
echo $three
echo $four
echo $five
