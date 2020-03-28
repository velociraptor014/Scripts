#!/usr/bin/env bash
# Variables initialization
groupname=default
activeuid=$UID
activeuser=$USER
activegid=$GID
# variables used : $groupname $activeuser $activeuid
tput bold; tput setaf 25
figlet -fsmall "Group"
echo "Adding Script v1.0"
tput sgr0
echo "You need to be root user to use this script."
echo "Checking UID..."
echo "ACTIVE UID : $activeuid (Script will only check UID)"
echo "ACTIVE USER: $activeuser (need to be ROOT/root/Root)"
echo "Your active GID is $GID, never try to override !"
if [[ $activeuid = 0 ]]; then
    tput setaf 2
    echo "Access Granted"
    tput sgr0
    echo "You are allowed to create new group."
    echo -n "Enter new group name : "
    read groupname
    echo "Choosen group name : $groupname"
    echo -n "Checking existence of $groupname's group..."
    if grep -q -E $groupname /etc/group &>/dev/null; then
        tput setaf 1
        echo " True. the $groupname already exist."
        echo "Operation aborted."
        tput sgr0
        exit
    else
        tput setaf 2
        echo " False, creating group!"
        tput sgr0
        sudo addgroup $groupname &>/dev/null
    fi
elif [[ $activeuid = * ]]; then
    tput setaf 1
    echo "You are not root. Access Denied."
    echo "For using this script, execute them using sudo command or from root account!" >> ~/.whyyouarerejected.userscript
    tput sgr0; exit
fi
