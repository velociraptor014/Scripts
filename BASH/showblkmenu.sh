#!/usr/bin/env bash
# This script will show a menu that allow user to show lsblk
# and ls /dev/ commands with filters. Using variables.
lsblk="lsblk"
lsblksd="ls /dev/sd*"
lsblktty="ls /dev/tty*"
lsblknvme="ls /dev/nvme*"
lsblkloop="ls /dev/loop*"
lsblkmem="ls /dev/mem*"
lsblkall="ls /dev/"
grepnvme=
grepsd=
blk=
clear
tput setaf 2;printf '
---------------------
BLK MENU CHOOSER v1.0
---------------------
This script menu show your current partitions,
virtual devices etc.. Into /dev/
and lsblk command.

Choose blk :

1) list all partitions and disks
2) list all sd* devices in /dev/ (if exist)
3) list all tty* lines in /dev/
4) list all nvme* devices in /dev/ (if exist)
5) list all loop virtual devices
6) list all mem devices in /dev/
7) list everything in /dev/
\n
'
tput setaf 3;echo -n "Make your choice (1/2/3/4/5/6/7/Abort) : "
read blk
if [[ $blk = 1 ]]; then
  echo "Listing blk partitions..."
  $lsblk 2> /dev/null
elif [[ $blk = 2 ]]; then
  echo "Listing Special Devices into /dev !"
  $lsblksd 2> /dev/null
elif [[ $blk = 3 ]]; then
  echo "Listing TTY lines (in /dev/)"
  $lsblktty 2> /dev/null
elif [[ $blk = 4 ]]; then
  echo "Listing NVME devices in /dev/"
  $lsblknvme 2> /dev/null
elif [[ $blk = 5 ]]; then
  echo "Listing loop virtual devices"
  $lsblkloop 2> /dev/null
elif [[ $blk = 6 ]]; then
  echo "Listing memory device(s) into /dev/"
  $lsblkmem 2> /dev/null
elif [[ $blk = 7 ]]; then
  echo "Listing everything into /dev/"
  $lsblkall 2> /dev/null
elif [[ =blk = * ]]; then
  echo "Incorrect input / Empty input"
  echo "Aborting!"
  exit
elif [[ $blk = [Aa]bort ]]; then
  echo "Aborting!"
  exit
elif [[ -z "$blk" ]]; then
  echo "Aborting!"
  exit
fi
exit
