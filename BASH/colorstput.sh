#!/usr/bin/env bash
CLRVAR=0
while [[ $CLRVAR -le 255 ]]; do
	tput setaf $CLRVAR;echo "Color"
	CLRVAR=$(($CLRVAR + 1))
done