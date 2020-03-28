#!/usr/bin/env bash
var0=0
limit=$1
scale=$2
CLRVAR=0
if [[ $limit -gt 0 ]]; then
	while [ "$var0" -lt "$limit" ]
	do
		tput bold
		tput setaf $CLRVAR
		echo -n "$var0"
		echo -n "|"
		var0=`expr $var0 + 1`
        	CLRVAR=$(($CLRVAR + 1))
		sleep $2 &>/dev/null || echo "Invalid Scale, use 0.05 format or 1,2,3 format."
	done
	CLRVAR=$(($CLRVAR + 1))
	tput setaf $CLRVAR
	echo "$limit"
	exit 0
elif [[ $limit -eq 0 || $limit = * ]]; then
	tput setaf 1; tput bold
	echo "Invalid Input"
	tput sgr0
	exit 1
fi
