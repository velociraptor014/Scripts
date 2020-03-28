#!/usr/bin/env bash
# Allow user to show system files with a menu
catfstab="cat /etc/fstab"
cathostname="cat /etc/hostname"
cathosts="cat /etc/hosts"
choice=
printf '
------------------------------------------
  SYSTEM CONFIG FILES MENU CHOOSER V1.0b
------------------------------------------
This script will be updated with more features,
for now, you can :

fstab           : Show the fstab file
hostname        : Show the hostname file   
hosts           : Show the hosts file

'
echo -n "Make your choice : "
read choice
if [[ $choice = fstab ]]; then
	$catfstab
elif [[ $choice = hostname ]]; then
	$cathostname
elif [[ $choice = hosts ]]; then
	$cathosts
else
	echo "Aborting!"
	exit
fi