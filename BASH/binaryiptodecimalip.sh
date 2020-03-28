#!/usr/bin/env bash
ip1=0
ip2=0
ip3=0
ip4=0
cb1=
cb2=
cb3=
cb4=
tput bold;tput setaf 25
figlet "01 to 192" 2>/dev/null
tput sgr0
echo "
------------------------------
$(tput bold; tput smul;echo -ne " IP BIN TO IP DEC CONVERTER ";tput sgr0)
------------------------------
This script will convert your binary
ip address to decimal one.

This script need toilet package (apt-get install toilet)
Absence will make an error !

Enter all dot to dot values
(xxxxxxxx.xxxxxxxx.xxxxxxxx.xxxxxxxx)

Binaries will NOT be checked ! (format)

"
echo "Enter your first dot (________.) : "
read ip1
echo "ibase=2;obase=A;$ip1" | bc > ....cb1
echo "Enter your second dot $(tput bold;echo "$ip1.________: .";tput sgr0)"
read ip2
echo "ibase=2;obase=A;$ip2" | bc > ....cb2
echo "Enter your third dot $(tput bold;echo "$ip1.$ip2.________: .$";tput sgr0)"
read ip3
echo "ibase=2;obase=A;$ip3" | bc > ....cb3
echo "Enter your fourth $(tput bold;echo "$ip1.$ip2.$ip3.________: .$";tput sgr0)"
read ip4
echo "ibase=2;obase=A;$ip4" | bc > ....cb4
echo "Your binary ip address :"
tput bold
echo "$ip1.$ip2.$ip3.$ip4" | toilet --font wideterm 2>/dev/null
tput sgr0
echo "Translated in Decimal :"
tput bold
echo "` cat ....cb1`.`cat ....cb2`.`cat ....cb3`.`cat ....cb4`" | toilet --font wideterm 2>/dev/null
tput sgr0
echo
echo "Finished."
rm ....cb1 ....cb2 ....cb3 ....cb4