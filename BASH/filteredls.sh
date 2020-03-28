#!/usr/bin/env bash
echo - "
▛▀▘▗▜▐             ▌ ▌  ▞▀▖
▙▄ ▄▐▜▀ ▞▀▖▙▀▖▞▀▖▞▀▌ ▌  ▚▄ 
▌  ▐▐▐ ▖▛▀ ▌  ▛▀ ▌ ▌ ▌  ▖ ▌
▘  ▀▘▘▀ ▝▀▘▘  ▝▀▘▝▀▘ ▀▀▘▝▀
"
echo "
Choose your filters using glob characters (*)

For example :

*.txt - '.txt' extension
*.*   - Whatever extension (hide no extension)
.*    - Show hidden files

A*D* - Begin with A and include D
*A*D - Include A and finish by D
"
read f1 f2 f3 f4
for i in $f1 $f2 $f3 $f4
do
    tput setaf 2;tput bold
    echo $i
    sleep 0.02
done
tput sgr0