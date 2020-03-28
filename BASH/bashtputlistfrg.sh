#!/bin/bash

    # tput_colors - Demonstrate color combinations.
    # Into bash colors, you have 255 colors / 255
    # This script show all colors into all modes (foreground and background)
    # In total, the script will show 510 outputs.
clear
tput blink;tput rev; echo "	Generating...	"; tput sgr0
fg_color=0
bg_color=0
    for fg_color in {0..255}; do
        set_foreground=$(tput bold;tput setaf $fg_color)
	sleep 0.05
        echo -n $set_background$set_foreground
        printf '█%s█' $fg_color
        echo -n $(tput sgr0)
    done