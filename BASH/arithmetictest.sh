#!/usr/bin/env bash
echo "type the minimum value and maxmium value"
echo -n "Min = "
read minimum
echo -n "Max = "
read maximum
for ((i=$minimum ; $i <= $maximum ; i++))
do
    tput setaf $i
    echo $i
    sleep 0.02
done