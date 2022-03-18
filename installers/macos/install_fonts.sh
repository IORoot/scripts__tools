#!/bin/bash

echo 'Listing'

# Regular Colors
NC='\033[0m'                  # NO Colour (reset)
Black='\033[0;30m'         # Black
Red='\033[0;31m'           # Red
Green='\033[0;32m'         # Green
Yellow='\033[0;33m'        # Yellow
Orange='\033[0;34m'        # Orange
Purple='\033[0;35m'        # Purple
Cyan='\033[0;36m'          # Cyan
White='\033[0;37m'         # White

TARGET_DIR=~/Library/Fonts
FONT_DIR=$INSTALL_DIR/scripts/lib/fonts

for fontfile in $FONT_DIR/*;
do
    # Basname, not full path
    FILE=${fontfile##*/}

    if [ -f $TARGET_DIR/$FILE ]; then
        printf "${Green}%-10s ${Purple}%-83s ${NC}%s\n" "" "- ${FILE}" "Already Installed"
    else
        # echo $TARGET_DIR/$fontfile
        cp $FONT_DIR/$FILE $TARGET_DIR/$FILE
        printf "${Green}Installing - ${Cyan}%-50s  ${NC}\n" $fontfile;
    fi

done    
