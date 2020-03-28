#!/usr/bin/env bash
user=$UID
if  [[ $user = 0 ]]; then
    tput setaf 2
    echo "Access Granted"
    tput sgr0
    if grep -q -E /etc/passwd; then
        if [[ $1 = * ]];[[ $2 = * ]]; then
            sudo usermod --shell=$2 $1
            echo "The $1's shell has been set to"
            echo "$2 shell location. It will be active at next logon."
            exit 0
        else
            echo "No arguments given !"
            printf '
            For giving arguments to this script, enter ./[scriptname] [shellbinary] [username]
            '
        fi
    else
        echo "User does'nt exist anymore!"
        exit 1
    fi
    exit 0
elif [[ $user = * ]]; then
    tput setaf 1
    echo "Access Denied"
    tput sgr0
    exit 1
fi