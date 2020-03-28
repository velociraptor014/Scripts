#!/bin/bash

    # tput_colors - Demonstrate color combinations.
    # Into bash colors, you have 255 colors / 255
    # This script show all colors into all modes (foreground and background)
    # In total, the script will show 510 outputs.
clear
tput blink;tput rev; echo "	Generating...	"; tput sgr0
bg_color=0
	for bg_color in {0..255}; do
        set_background=$(tput setab $bg_color)
	sleep 0.05
        echo -n $set_background$set_foreground
        printf '  %s  ' $bg_color
        echo -n $(tput sgr0)
    done