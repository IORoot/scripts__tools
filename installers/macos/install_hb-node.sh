#!/bin/bash

# Dependencies
# pandoc ✘, rust ✘

if [ -f "/opt/homebrew/bin/brew" ]; then

    if [ -f /opt/homebrew/bin/node ]; then
        printf "Already Installed\n"
    else
        brew list node 1>/dev/null || brew install node                  #
        printf "DONE\n"
    fi

else
    printf "HOMEBREW Not Installed\n"
fi