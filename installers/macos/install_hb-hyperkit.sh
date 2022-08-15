#!/bin/bash

# Dependencies
# pandoc ✘, rust ✘

if [ -f "/opt/homebrew/bin/brew" ]; then

    if [ -d /usr/local/Cellar/hyperkit ]; then
        printf "Already Installed\n"
    else
        brew list hyperkit 1>/dev/null || brew install hyperkit
        printf "DONE\n"
    fi

else
    printf "HOMEBREW Not Installed\n"
fi
