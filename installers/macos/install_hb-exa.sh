#!/bin/bash

# Dependencies
# pandoc ✘, rust ✘

if [ -f "/opt/homebrew/bin/brew" ]; then

    if [ -f /opt/homebrew/bin/exa ]; then
        printf "Already Installed\n"
    else
        brew list exa 1>/dev/null || brew install exa                  #
        printf "DONE\n"
    fi

else
    printf "HOMEBREW Not Installed\n"
fi