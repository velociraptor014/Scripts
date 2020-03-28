#!/usr/bin/env bash
var0=0
limit=$1
CLRVAR=0
if [[ $limit -gt 0 ]]; then
	while [ "$var0" -lt "$limit" ]
	do
		tput bold
		tput setaf $CLRVAR
		figlet -n "$var0"
		var0=`expr $var0 + 1`
        CLRVAR=$(($CLRVAR + 1))
	done
	CLRVAR=$(($CLRVAR + 1))
	tput setaf $CLRVAR
	figlet "$limit"
	exit 0
elif [[ $limit -eq 0 || $limit = * ]]; then
	tput setaf 1; tput bold
	echo "Invalid Input"
	tput sgr0
	exit 1
fi
