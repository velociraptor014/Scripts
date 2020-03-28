#!/usr/bin/env bash
# Variable initialization
dir=${1- `pwd`}
# =======================
echo "Symbolic Links of directory \"$dir\""

for file in "$( find $dir -type l )"   # -type 1 define them as symlink.
do
	echo "$file"
done | sort                            # File sorting, using "sort" command

