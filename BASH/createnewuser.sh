#:/usr/bin/env bash
# Variables initialization
username=default
password=default
activeuid=$UID
activeuser=$USER
# After update
name=john
surname=wick
# variables used : $username $activeuid $activeuser $password
tput bold; tput setaf 25
figlet -fsmall "User"
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
    echo "You are allowed to create new user."
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
    fi
elif [[ $activeuid = * ]]; then
    tput setaf 1
    echo "You are not root. Access Denied."
    echo "For using this script, execute them using sudo command or from root account!" >> ~/.whyyouarerejected.userscript
    tput sgr0; exit
fi
