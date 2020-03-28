mode=
word=
figlet LOGO
echo "Compositor on Toilet Package"
echo
echo "Choose a mode 
[(big/sm)ascii12/(big/sm)ascii9/(big/sm)mono12/(big/sm)mono9]
[circle/emboss/emboss2/future/letter/pagga/wideterm]"
read mode
echo
echo "Type your word"
echo
echo -n '--->|'
read word
echo
echo ======================
echo
echo " " >> Logo.txt 
echo
tput bold
toilet --font $mode "$word" >> Logo.txt
toilet --font $mode "$word" || echo "Failed Making ! You need to type the correct mode."
tput sgr0
echo
echo " " >> Logo.txt
echo
echo ======================
