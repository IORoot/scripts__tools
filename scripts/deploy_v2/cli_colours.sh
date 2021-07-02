#!/bin/bash

# Terminal Colours
# https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux

cli_colours() {
    # Reset
    NC='\033[0m'                  # NO Colour (reset)

    # Regular Colors
    Black='\033[0;30m'         # Black
    Red='\033[0;31m'           # Red
    Green='\033[0;32m'         # Green
    Yellow='\033[0;33m'        # Yellow
    Orange='\033[0;34m'        # Orange
    Purple='\033[0;35m'        # Purple
    Cyan='\033[0;36m'          # Cyan
    White='\033[0;37m'         # White

    # Bold
    B_Black='\033[1;30m'       # Black
    B_Red='\033[1;31m'         # Red
    B_Green='\033[1;32m'       # Green
    B_Yellow='\033[1;33m'      # Yellow
    B_Orange='\033[1;34m'      # Orange
    B_Purple='\033[1;35m'      # Purple
    B_Cyan='\033[1;36m'        # Cyan
    B_White='\033[1;37m'       # White

    # Underline
    U_Black='\033[4;30m'       # Black
    U_Red='\033[4;31m'         # Red
    U_Green='\033[4;32m'       # Green
    U_Yellow='\033[4;33m'      # Yellow
    U_Orange='\033[4;34m'      # Orange
    U_Purple='\033[4;35m'      # Purple
    U_Cyan='\033[4;36m'        # Cyan
    U_White='\033[4;37m'       # White

    # High Intensity
    I_Black='\033[0;90m'       # Black
    I_Red='\033[0;91m'         # Red
    I_Green='\033[0;92m'       # Green
    I_Yellow='\033[0;93m'      # Yellow
    I_Orange='\033[0;94m'      # Orange
    I_Purple='\033[0;95m'      # Purple
    I_Cyan='\033[0;96m'        # Cyan
    I_White='\033[0;97m'       # White

    # Bold High Intensity
    H_Black='\033[1;90m'       # Black
    H_Red='\033[1;91m'         # Red
    H_Green='\033[1;92m'       # Green
    H_Yellow='\033[1;93m'      # Yellow
    H_Orange='\033[1;94m'      # Orange
    H_Purple='\033[1;95m'      # Purple
    H_Cyan='\033[1;96m'        # Cyan
    H_White='\033[1;97m'       # White

    # Background
    BG_Black='\033[40m'        # Black
    BG_Red='\033[41m'          # Red
    BG_Green='\033[42m'        # Green
    BG_Yellow='\033[43m'       # Yellow
    BG_Orange='\033[44m'       # Orange
    BG_Purple='\033[45m'       # Purple
    BG_Cyan='\033[46m'         # Cyan
    BG_White='\033[47m'        # White

    # High Intensity backgrounds
    BG_I_Black='\033[0;100m'   # Black
    BG_I_Red='\033[0;101m'     # Red
    BG_I_Green='\033[0;102m'   # Green
    BG_I_Yellow='\033[0;103m'  # Yellow
    BG_I_Orange='\033[0;104m'  # Orange
    BG_I_Purple='\033[0;105m'  # Purple
    BG_I_Cyan='\033[0;106m'    # Cyan
    BG_I_White='\033[0;107m'   # White

}

# run function
cli_colours