#!/bin/bash

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

BINPATH="/usr/local/bin"

echo 'Listing' # downarrow
/usr/bin/find $INSTALL_DIR/scripts/bin -name \*.sh -print0 | while read -d $'\0' ABSOLUTEPATH
do

    BASENAME=${ABSOLUTEPATH##*/}
    MINUS_EXT="${BASENAME%.*}"
    SCRIPT="${BINPATH}/${MINUS_EXT}"

    if [ ! -f $SCRIPT ]; then   
        ln -s ${ABSOLUTEPATH} ${SCRIPT};
        printf "${CYAN}Linked %-50s ${ORANGE} --> ${GREEN} %-6s ${NC}\n" "${SCRIPT}" "${ABSOLUTEPATH}";
    else 
        printf "${Green}%-10s ${Purple}%-83s ${NC}%s\n" "" "- ${SCRIPT}" "Already Installed"
    fi
    
done