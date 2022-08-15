#!/bin/bash

# Dependencies
# pandoc ✘, rust ✘

if [ -f "/opt/homebrew/bin/brew" ]; then

    if [ -f /opt/homebrew/bin/python3.10 ]; then
        printf "Already Installed\n"
    else
        brew list --cask python3 1>/dev/null || brew install python3
        printf "DONE\n"
    fi

else
    printf "HOMEBREW Not Installed\n"
fi