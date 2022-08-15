#!/bin/bash

# Dependencies
# pandoc ✘, rust ✘

if [ -f "/opt/homebrew/bin/brew" ]; then

    if [ -d /usr/local/Cellar/jq ]; then
        printf "Already Installed\n"
    else
        brew list jq 1>/dev/null || brew install jq                  #
        printf "DONE\n"
    fi

else
    printf "HOMEBREW Not Installed\n"
fi