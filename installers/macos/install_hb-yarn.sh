#!/bin/bash

# Dependencies
# pandoc ✘, rust ✘

if [ -f "/opt/homebrew/bin/brew" ]; then

    if [ -d /usr/local/Cellar/yarn ]; then
        printf "Already Installed\n"
    else
        brew list yarn 1>/dev/null || brew install yarn                  #
        printf "DONE\n"
    fi

else
    printf "HOMEBREW Not Installed\n"
fi