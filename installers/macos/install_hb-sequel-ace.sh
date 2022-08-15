#!/bin/bash

# Dependencies
# pandoc ✘, rust ✘

if [ -f "/opt/homebrew/bin/brew" ]; then

    if [ -d /usr/local/Caskroom/sequel-ace ]; then
        printf "Already Installed\n"
    else
        brew list --cask sequel-ace 1>/dev/null || brew install --cask sequel-ace                  #
        printf "DONE\n"
    fi

else
    printf "HOMEBREW Not Installed\n"
fi