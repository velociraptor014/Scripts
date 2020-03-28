#!/usr/bin/env bash
ip1=0
ip2=0
ip3=0
ip4=0
bc1=
bc2=
bc3=
bc4=
tput setaf 25
figlet "192 to 01" 2>/dev/null
tput sgr0
echo "
----------------------------
$(tput bold; tput smul;echo -ne " IP DEC TO IP BIN CONVERTER ";tput sgr0)
----------------------------
This script will convert your ip address
to binary one.

This script need toilet package, install with

apt-get install toilet

Enter all dot to dot values (xxx.xxx.xxx.xxx)

"
echo "Enter your first dot	___. : "
read ip1
echo "scale=8;obase=2;$ip1" | bc > ....bc1
echo "Enter your second dot 	$(tput bold;echo "$ip1.___.: .";tput sgr0)"
read ip2
echo "scale=8;obase=2;$ip2" | bc > ....bc2
echo "Enter your third dot 	$(tput bold;echo "$ip1.$ip2.___.: .";tput sgr0)"
read ip3
echo "scale=8;obase=2;$ip3" | bc > ....bc3
echo "Enter your fourth dot	$(tput bold;echo "$ip1.$ip2.$ip3.___: .";tput sgr0)"
read ip4
echo "scale=8;obase=2;$ip4" | bc > ....bc4
echo "Your ip address :"
tput bold
echo "$ip1.$ip2.$ip3.$ip4" | toilet --font wideterm 2>/dev/null
tput sgr0
echo "Translated in Binary :"
tput bold
echo "`cat ....bc1`.`cat ....bc2`.`cat ....bc3`.`cat ....bc4`" | toilet --font wideterm 2>/dev/null
tput sgr0
echo
echo "Finished."
rm ....bc1 ....bc2 ....bc3 ....bc4
