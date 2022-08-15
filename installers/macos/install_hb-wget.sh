#!/bin/bash

# Dependencies
# pandoc ✘, rust ✘

if [ -f "/opt/homebrew/bin/brew" ]; then

    if [ -d /usr/local/Cellar/wget ]; then
        printf "Already Installed\n"
    else
        brew list wget 1>/dev/null || brew install wget                  #
        printf "DONE\n"
    fi

else
    printf "HOMEBREW Not Installed\n"
fi