#!/usr/bin/env bash
# Initialize variables
activeuser=$USER
activeuid=$UID
lxdeinstall=lubuntu-desktop
xfceinstall=xfce4
enlightenmentinstall=enlightenment
gnomeinstall=ubuntu-desktop
cinnamoninstall=cinnamon
kdeinstall=kubuntu-desktop
lightdminstall=lightdm
gdm3install=gdm3
# --------------------
printf '
▞▀▖  ▌ ▌  ▜▘   ▜▘      ▐     ▜▜       
▌▄▖  ▌ ▌  ▐    ▐ ▛▀▖▞▀▘▜▀ ▝▀▖▐▐ ▞▀▖▙▀▖
▌ ▌▗▖▌ ▌▗▖▐ ▗▖ ▐ ▌ ▌▝▀▖▐ ▖▞▀▌▐▐ ▛▀ ▌  
▝▀ ▝▘▝▀ ▝▘▀▘▝▘ ▀▘▘ ▘▀▀  ▀ ▝▀▘ ▘▘▝▀▘▘  
General User Interface Installation Script

This script only work perfectly on Ubuntu (or variants)

All GUI will appear on your login screen into the
GUI changer icon (on Kubuntu, Ubuntu GNOME and Ubuntu Variants)

You need to be root user to use this script.
'
echo
echo "
Checking active user for authorization...
"
sleep 2
if [[ $UID = 0 ]]; then
    tput setaf 2
    echo "
Access Granted!
(User:$activeuser, UID:$activeuid)
";tput sgr0
    echo
    echo "
For installing a GUI, you need to choose what GUI you want
to install :

For doing that, enter any of theses words  (without any case and exactly like this):

cinnamon        (package : $cinnamoninstall)
kde             (package : $kdeinstall)
lxde            (package : $lxdeinstall)
xfce            (package : $xfceinstall)
elight          (package : $enlightenmentinstall)
"
    echo
    echo -n "Enter your choice : "
    read choice
    if [[ $choice = cinnamon ]]; then
        echo "Installing $cinnamoninstall..."
        echo
        apt-get --assume-yes install $cinnamoninstall
        echo
        echo "Installation Done, in case of absence of paquet, check your apt database."
    elif [[ $choice = kde ]]; then
        echo "Installing $kdeinstall..."
        echo
        apt-get --assume-yes install $kdeinstall
        echo
        echo "Installation Done, in case of absence of paquet, check your apt database."
    elif [[ $choice = lxde ]]; then
        echo "Installing $lxdeinstall..."
        echo
        apt-get --assume-yes install $lxdeinstall
        echo
        echo "Installation Done, in case of absence of paquet, check your apt database."
    elif [[ $choice = xfce ]]; then
        echo "Installing $xfceinstall..."
        echo
        apt-get --assume-yes install $xfceinstall
        echo
        echo "Installation Done, in case of absence of paquet, check your apt database."
    elif [[ $choice = elight ]]; then
        echo "Installing $enlightenmentinstall..."
        echo
        apt-get --assume-yes install $enlightenmentinstall
        echo
        echo "Installation Done, in case of absence of paquet, check your apt database."
    else
        tput setaf 1
        echo "Invalid Input !"
        tput sgr0
    fi
elif [[ $UID = * ]]; then
    tput setaf 1
    echo "
Access Denied.
Root access required.
(User:$activeuser, UID:$activeuid)
";tput sgr0
fi

