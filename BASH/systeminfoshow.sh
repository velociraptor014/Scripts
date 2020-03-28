#!/usr/bin/env bash
# This script will ask you for showing LS. but in different way, with -l, -la, and -x.
# Execute as root for more features !
# Used variable : $lschoose, $ls*
lscpu="lscpu"
lshw="lshw"
lsmem="lsmem"
lsblk="lsblk"
lshwshort="lshw -short"
lshwmemory="lshw -short -c memory"
any="echo Aborting."
lschoose=
UID_CHECK=0
printf '
-------------------------
 SYSTEM INFORMATION MENU
-------------------------\n
'
echo "Make your choice : "
echo -n "
0) processor     : Show CPU informations
1) hardware      : Full hardware informations
2) hardwareshort : Short but powerfull informations
3) memory        : RAM informations
4) memory_root   : RAM informations as root
5) sysmem        : RAM Full informations
6) disks         : Show partitions and disks\n

Active User Informations :

UID  : $UID
User : $USER
Date : `date`

Your choice [0/1/2/3/4/5/6/Abort]
"
read lschoose
if [[ $lschoose = 0 ]]; then
  $lscpu
elif [[ $lschoose = 1 ]]; then
  $lshw
elif [[ $lschoose = 2 ]]; then
  $lshwshort
elif [[ $lschoose = 3 ]]; then
  $lshwmemory 2> /dev/null
elif [[ $lschoose = 4 ]]; then
  if [[ $UID = 0 ]]; then
  	$lshwmemory 2> /dev/null
  elif [[ $UID = * ]]; then
  	echo "
You are not ROOT (your UID = $UID), if
you want to use this feature :

run 'sudo ./[script.sh]'

or

run 'sudo su' and then run './[script.sh]'
  	"
  	exit
  fi
elif [[ $lschoose = 5 ]]; then
  $lsmem
elif [[ $lschoose = 6 ]]; then
  $lsblk
elif [[ $lschoose = * ]]; then
  $any
fi
