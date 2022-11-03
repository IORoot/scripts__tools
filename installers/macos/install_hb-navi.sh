#!/bin/bash

# Dependencies
# pandoc ✘, rust ✘

if [ -f "/opt/homebrew/bin/brew" ]; then

    if [ -f /opt/homebrew/bin/navi ]; then
        printf "Already Installed\n"
    else
        brew list navi 1>/dev/null || brew install navi                  #
        printf "DONE\n"
    fi

else
    printf "HOMEBREW Not Installed\n"
fi