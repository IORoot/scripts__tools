#!/bin/bash

export INSTALL_DIR=`pwd`

detect_os() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        echo '-- Detected MacOS --';
        FOLDER=macos;

    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        FLAVOUR=`cat /etc/os-release | grep '^NAME=' | grep -oP '".*"' | sed 's/"//g'`

        if [[ "$FLAVOUR" == "Ubuntu"* ]]; then
            echo '-- Detected UBUNTU --'
            FOLDER=ubuntu;

        elif [[ "$FLAVOUR" == "Pop!_OS"* ]]; then
            echo '-- Detected Pop! OS --'
            FOLDER=ubuntu;
        
        elif [[ "$FLAVOUR" == "CentOS Linux"* ]]; then
            echo '-- Detected CENTOS --';
            FOLDER=centos;

        else
            echo 'Unknown Linux Flavour. Exiting.';
        fi

    else
        echo 'Unknown OS. Exiting.';
    fi
}



install() {

    # CHECK Generic first
    GENERIC="./installers/generic/install_${1}.sh"
    if [ -f $GENERIC ]; then
        message $1 $GENERIC
        $GENERIC
    fi


    SCRIPT="./installers/${FOLDER}/install_${1}.sh"
    if [ -f $SCRIPT ]; then
        message $1 $SCRIPT
        $SCRIPT
    else
        printf "Skipping - no package called ${SCRIPT}\n"
    fi
}


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
}


message()
{
    printf "${Green}%-10s - ${Cyan}%-20s ${Yellow}%-60s ${NC}" "Installing" $1 $2
}


# EXAMPLE: variable_replace .zshrc ZSH_THEME robbyrussell
variable_replace()
{
    if [ "$#" -ne 3 ]; then
        exit 1
    fi

    FILE=$1
    VARIABLE=$2
    REPLACE=$3

    if [ ! -f $FILE ]; then
        exit 1
    fi

    STRING="s;${VARIABLE}=\".*\";${VARIABLE}=\"${REPLACE}\";g";

    sed -i -e $STRING $FILE
}


load_profile()
{
    HOSTNAME=$(hostname)

    if [ -f $INSTALL_DIR/profiles/$HOSTNAME ]; then
        source $INSTALL_DIR/profiles/$HOSTNAME
    else
        echo "No profile found for this hostname."
    fi
    
}

cli_colours
detect_os
load_profile