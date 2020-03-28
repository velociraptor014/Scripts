#!/bin/bash

    # tput_colors - Demonstrate color combinations.
clear
tput blink;tput rev; echo "	Generating...	"; tput sgr0
fg_color=0
bg_color=0
if [[ $fg_color -le 0 ]];[[ $bg_color -le 0 ]]; then
    for fg_color in {255..0}; do
        set_foreground=$(tput setaf $fg_color)
        for bg_color in {0..255}; do
            set_background=$(tput setab $bg_color)
	sleep 0.01
            echo -e $set_background$set_foreground
            printf ' F:%s B:%s ' $fg_color $bg_color
        done
        echo $(tput sgr0)
    done
elif [[ $fg_color = 255 ]];[[ $bg_color = 255 ]]; then
	echo "Finished"
	exit
fi