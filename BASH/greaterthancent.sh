#!/bin/bash
echo "Choose a number greater than 100"
read lecture
number=${lecture:-0}
while [ $number -le 100 ]
do
  echo "$number is not greater than 100."
  echo "Please enter a number greated than 100!"
  read lecture
  number=${lecture:-0}
done
echo "Finally, $number is greater than 100 !"
