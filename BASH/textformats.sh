#!/bin/bash

    # tput_characters - Test various character attributes

    clear

    tput bold; tput rev;echo "
 tput character test  
======================
 tput character color 
    "; tput sgr0

    tput bold;  echo "This text has the bold attribute.";     tput sgr0

    tput smul;  echo "This text is underlined (smul).";       tput rmul

    # Most terminal emulators do not support blinking text (though xterm
    # does) because blinking text is considered to be in bad taste ;-)
    # The WSL terminal (Under Windows environment DO NOT SUPPORT blinking)
    tput blink; echo "This text is blinking (blink).";        tput sgr0

    tput rev;   echo "This text has the reverse attribute";   tput sgr0

    # Standout mode is reverse on many terminals, bold on others. 
    tput smso;  echo "This text is in standout mode (smso)."; tput rmso

    tput sgr0
    echo "==========================="
    echo
    tput rev        ; echo "Black & White"; tput sgr0
    tput setaf 1    ; echo "Red"
    tput setaf 2    ; echo "Green"
    tput setaf 3    ; echo "Yellow"
    tput setaf 4    ; echo "Blue"
    tput setaf 5    ; echo "Purple"
    tput setaf 6    ; echo "Cyan"
    tput setaf 7    ; echo "Light Gray"
    tput setaf 8    ; echo "Dark Gray"
    tput setaf 9    ; echo "Warning Red"
    tput setaf 10   ; echo "Granted Green"
    tput setaf 11   ; echo "Warning Yellow"
    tput setaf 12   ; echo "Light Purple"
    tput setaf 13   ; echo "Light Cyan"
    echo
    tput bold; tput smul; tput setaf 4;echo "
You can use $(tput blink;echo -n " /RESSOURCES/colortput.sh"; tput sgr0) $(tput bold; tput smul; tput setaf 4;echo -n "script in
this repo to see all colors. You need to run it with bash
or by chmod +x !")"; tput sgr0
    echo
    tput bold; tput rev; echo "============================="
    echo "   Blinking, Bold and sgr0   ";tput sgr0
    echo
    echo "
The logic is the next one :

At beginning, use tput with arg (like 'tput setaf' or 'tput bold'), do the echo command with the text to be bold or setafed.
At the end, after echo and after ';', use 'tput sgr0' to restore normal mode. This fix instantly continuous tputing.
    "
