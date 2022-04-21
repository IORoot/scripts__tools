#!/bin/bash

# Dependencies
# pandoc ✘, rust ✘

if [ -f "/usr/local/bin/brew" ]; then

    if [ -d /usr/local/Cellar/python@3.9 ]; then
        printf "Already Installed\n"
    else
        brew list --cask python3 1>/dev/null || brew install python3
        printf "DONE\n"
    fi

else
    printf "HOMEBREW Not Installed\n"
fi