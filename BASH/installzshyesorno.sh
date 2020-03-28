#!/usr/bin/env bash
# This script will ask you to install ZSH (Ubuntu/DEB/APT Only)
# Package : zsh, using variable.
# To make this script working fully, you need to run it as root.
# Read the script before if you are aware !
pti=zsh
echo -n "Do you want to install Z-Shell ($pti)?(Y/n)"
read ask
if [[ $ask = [Yy] ]]; then
  echo "Installing Z-Shell or ($pti)..."
  apt install $pti &> /dev/null
  echo "Finished, checking if the package is present..."
  checkpkg=`which zsh`
  if [[ $checkpkg = /usr/bin/zsh ]]; then
    echo "Package present."
    echo "Installation success"
  elif [[ $checkpkg = * ]]; then
    echo "Error !"
    echo "Try to install manually"
  fi
elif [[ $ask = [Nn] ]]; then
  echo "Aborted."
  exit
elif [[ $ask = * ]]; then
  echo "Aborted."
  exit
fi
