#!/bin/bash

# V.
# Vagrant wrapper,
# This will run vagrant commands on boxes you specifiy. It greps for the ID within `vagrant global-status` and runs the command against that ID.

## Setup
#  Place all of your vagrant boxes into one parent folder and set the following environment variable in your .zshrc / .bashrc:

#  export VAGRANTPATH=/Users/USERNAME/vagrant

# Change `/Users/USERNAME/vagrant` to wherever your vagrant folders are.



INPUTCOUNT=$#
COMMAND=$1
MACHINE=$2

# Check that vagrantpath is set
checkpath(){
    if [[ -z "${VAGRANTPATH}" ]]; then
        echo "VAGRANTPATH is not set in this environment. Please set it before continuing."
        exit 1
    fi
}


# Check the vagrant machine variable is being passed in.
checkinput(){
    if [ $INPUTCOUNT -ne 2 ]; then
        echo "$0 [COMMAND] [VM]"
        exit 1
    fi
}

# Find ID of machine.
getid(){
    
    ID=`vagrant global-status | grep "$MACHINE" | cut -d ' ' -f 1`
    if [ ! ${#ID} -eq 7 ]; 
        then
            cli_text "RED" "Machine Not Found"
            exit 1
        else 
            cli_text "BLUE" "Machine Found for ${MACHINE}. ID:" $ID;
    fi
}


cli_colours() {
    # Terminal Colours
    RED='\033[0;31m'
    GREEN='\033[0;32m'
    ORANGE='\033[0;34m'
    CYAN='\033[0;36m'
    GREY='\033[0;90m'
    NC='\033[0m' # No Color
}


cli_text() {
    # Default NoColour
    if [ "$#" -eq 1 ]; then
        printf "${NC} $1 \n"
    fi
    if [ "$#" -eq 2 ]; then
        COLOUR=$1
        printf "${!COLOUR} $2 \n"
    fi
}

# Echo Header to CLI
cli_header() {
    printf "${CYAN} $1 \n"
    printf "${ORANGE} ----------------------------------------\n"
}

vagrantcommand(){
    /usr/local/bin/vagrant $COMMAND $ID
}

cli_colours
checkpath
checkinput
getid
cli_header "Vagrant ${COMMAND} ${ID}"
vagrantcommand