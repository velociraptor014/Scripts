#!/usr/bin/env bash
# System
blk=`lsblk`      ; 
usb=`lsusb`      ; 
hw=`lshw -short` ; 
# Listing
list=`ls` ; listhidden=`ls -la`
listall=`ls` -a ; listroot= `ls -la /`
# File manager
move=`mv` ; remove=`rm`          ; rename=`mv`
copy=`cp` ; removeforce=`rm -rf` ; rights=`chmod -R`
exe=`chmod` -R +x ; allrights=`chmod -R 777`