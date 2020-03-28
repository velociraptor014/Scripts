#!/usr/bin/env bash
tput setaf 25
toilet --font wideterm "Listing"
echo
echo "$*"
echo
ls -la $*
echo
tput sgr0