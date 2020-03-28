#!/usr/bin/env bash
userid=$UID
# -----------------
echo -n "halt/reboot/hybern:"
read mode
sleep 2
if [[ $userid = 0 ]]; then
    if [[ $mode = halt ]]; then
        tput setaf 9
        figlet "HALT"
        sleep 2
        sudo systemctl halt
    elif [[ $mode = reboot ]]; then
        tput setaf 13
        figlet "REBOOT"
        sleep 2
        sudo systemctl reboot
    elif [[ $mode = hybern ]]; then
        tput setaf 11
        figlet "HYBERNATION"
        sleep 2
        sudo systemctl hybernate
    elif [[ $mode = * ]]; then
        tput setaf 1
        echo "Invalid Input"
        tput sgr0
    fi
elif [[ $userid = * ]]; then
    tput setaf 1
    echo "Root Access Required."
    tput sgr0
fi
tput sgr0