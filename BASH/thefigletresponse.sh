#!/usr/bin
echo "For experience, we will use FIGlet to answer the user (you, if you've launched this script!)"
echo
echo -n "Enter a word : "
read word
figlet $word
echo
printf '
The little code that has been runned previously :

echo -n "Enter a word : "
read word
figlet $word
'
echo
echo "In this example, the word entered by user is used by FIGlet after."
echo "Now, we will create a conditional for creating features : "
echo '
---------------------------------
 The FIGlet Features Tester Menu
---------------------------------
'
echo
echo "
Make a choice between :

Digital
Small
Big

"
echo -n "Your choice :[Digital/Small/Big]"
read choice
if [[ $choice = [Dd]igital ]]; then
    figlet -fdigital Digital
elif [[ $choice = [Ss]mall ]]; then
    figlet -fsmall Small
elif [[ $choice = [Bb]ig ]]; then
    figlet -fbig Big
else
    echo "Invalid Input"
fi
echo
sleep 2
printf '
The code that has been runned previously :

echo -n "Your choice :[Digital/Small/Big]"
read choice
if [[ $choice = [Dd]igital ]]; then
    figlet -fdigital Digital
elif [[ $choice = [Ss]mall ]]; then
    figlet -fsmall Small
elif [[ $choice = [Bb]ig ]]; then
    figlet -fbig Big
else
    echo "Invalid Input"
fi
'
echo
echo "For this example, we will use case conditional."
echo
printf '
The code that will be runned after this output :

question='Make your choice !'
options=("Digital" "Small" "Big")
select opt in "${options[@]}"
do
    case $opt in
        "Digital")
            figlet -fdigital Digital
            ;;
        "Small")
            figlet -fsmall Small
        "Big")
            ;;
            figlet -fbig Big
        *) echo "Invalid"
    esac
done
'
echo
question='Make your choice !'
options=("Digital" "Small" "Big")
select opt in "${options[@]}"
do
    case $opt in
        "Digital" )
            figlet -fdigital Digital
            exit
            ;;
        "Small" )
            figlet -fsmall Small
            exit
            ;;
        "Big" )
            figlet -fbig Big
            ;;
        *) echo "Invalid"
    esac
done