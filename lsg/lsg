#!/bin/zsh

# Terminal Colours
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;34m'
CYAN='\033[0;36m'
GREY='\033[0;90m'
NC='\033[0m' # No Color



for d in */; do

    if [[ -d "$d" && -e "$d/.git" ]]; then
        cd $d;
        DIFF=`git diff --shortstat`
        BRANCH=`git branch --show-current`
        REMOTE=`git config --get remote.origin.url`
        REMOTEBASE=`basename $REMOTE`
        printf "${NC} %-35s ${ORANGE} | %-6s | ${CYAN} %-50s | ${RED} %-35s \n" "$d" "${BRANCH}" "${REMOTEBASE}" "${DIFF}" 
        cd ..
    else
        echo "$d"
    fi

done