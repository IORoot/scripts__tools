#!/bin/bash

# Dependencies
# pandoc ✘, rust ✘

if [ -f "/opt/homebrew/bin/brew" ]; then

    if [ -f /usr/local/bin/vagrant ]; then
        printf "Already Installed\n"
    else
        brew list vagrant 1>/dev/null || brew install --cask vagrant                  #
        printf "DONE\n"
    fi

else
    printf "HOMEBREW Not Installed\n"
fi