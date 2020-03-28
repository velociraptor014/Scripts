#!/usr/bin/env bash
# This script will ask you for showing LS. but in different way, with -l, -la, and -x.
# -la will be shown "hidden " storage into lsh variable
# -l  will be shown "complex" storage into lsc variable
# -x  will be shown "simple " storage into lss variable
# Used variable : $lschoose, $lsh/c/s/n
lsh="ls -la"
lsc="ls -l"
lss="ls -x"
lsn="ls"
lschoose=
echo -n "Choose your LS, it will show the current directory (hidden,complex,simple): "
read lschoose
if [[ $lschoose = hidden ]]; then
  $lsh ./
elif [[ $lschoose = complex ]]; then
  $lsc ./
elif [[ $lschoose = simple ]]; then
  $lss ./
elif [[ $lschoose = * ]]; then
  $lsn ./
fi
