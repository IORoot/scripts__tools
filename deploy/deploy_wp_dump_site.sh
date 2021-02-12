#!/bin/bash

# Terminal Colours
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
GREY='\033[0;90m'
NC='\033[0m' # No Color


# Echo to CLI
cli_text() {
    if [ "$#" -eq 1 ]; then
        printf " - ${NC} $1 \n"
    fi
    if [ "$#" -eq 2 ]; then
        COLOUR=$1
        printf " - ${!COLOUR} $2 \n"
    fi
}

# Echo Header to CLI
cli_header() {
    printf "${RED}Wordpress Site Dump \n"
    echo "----------------------------------------"
}






cli_header