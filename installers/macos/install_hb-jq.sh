#!/bin/bash

# Dependencies
# pandoc ✘, rust ✘

if [ -f "/usr/local/bin/brew" ]; then

    if [ -L /usr/local/bin/jq ]; then
        printf "Already Installed\n"
    else
        brew list jq 1>/dev/null || brew install jq                  #
        printf "DONE\n"
    fi

else
    printf "HOMEBREW Not Installed\n"
fi