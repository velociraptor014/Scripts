#!/usr/bin/env bash
# Variables initialization
username=default
password=default
groupname=default
activeuid=$UID
activeuser=$USER
# After update
name=john
surname=wick
# variables used :  $username $password $groupname
#                   $activeuser $activeuid
tput bold; tput setaf 25
figlet -fsmall "User & Group"
echo "Adding Script v1.1"
tput sgr0
echo
echo "You need to be root user to use this script."
echo "Checking UID..."
echo "ACTIVE UID : $activeuid (Script will only check UID)"
echo "ACTIVE USER: $activeuser (need to be ROOT/root/Root)"
if [[ $activeuid = 0 ]]; then
    tput setaf 2
    echo "Access Granted"
    tput sgr0
    echo "You are allowed to create new user and to add them to a new group."
    echo -n "Enter the username : "
    read username
    echo -n "Set a name to $username : "
    read name
    echo -n "Set a surname to $username : "
    read surname
    echo -n "Enter UNIX password : "
    read -s password
    if grep $username /etc/passwd &>/dev/null; then
        tput setaf 1
        echo "User already exist !"
        tput sgr0
    else
        adduser --disabled-password --gecos $username,$name,$surname,, $username &>/dev/null
        echo
        echo "$username's user account has been created."
        echo -n "Setting up given password..."
        sleep 2
        sudo echo $username:$password | sudo /usr/sbin/chpasswd 
        echo " Done."
        echo
        echo -n "Now, enter a group name : "
        read groupname
        echo -n "Checking group existence..."
        if grep -q -E $groupname /etc/group; then
            tput setaf 1
            echo " True. This group already exist, group creation has been cancelled."
            echo "Created user has their own group. ($username)"
            echo "Use Group Adding Script for adding new group."
            tput sgr0
            exit
        else
            tput setaf 2
            echo " False, creating group!"
            tput sgr0
            sudo addgroup $groupname &>/dev/null
            sudo usermod -a -G $groupname $username &>/dev/null
            echo "The user $username has been added to $groupname group !"
            exit
        fi
    fi
elif [[ $activeuid = * ]]; then
    tput setaf 1
    echo "You are not root. Access Denied."
    echo "For using this script, execute them using sudo command or from root account!" >> ~/.whyyouarerejected.userscript
    tput sgr0; exit
fi
