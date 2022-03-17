#!/bin/bash

# Dependencies
# pandoc ✘, rust ✘

if [ -f "/usr/local/bin/brew" ]; then

    if [ -L /usr/local/bin/wget ]; then
        printf "Already Installed\n"
    else
        brew list wget 1>/dev/null || brew install wget                  #
        printf "DONE\n"
    fi

else
    printf "HOMEBREW Not Installed\n"
fi