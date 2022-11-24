#!/bin/bash

# Dependencies
# pandoc ✘, rust ✘

if [ -f "/opt/homebrew/bin/brew" ]; then

    if [ -f /opt/homebrew/bin/fig ]; then
        printf "Already Installed\n"
    else
        brew list fig 1>/dev/null || brew install fig                  #
        printf "DONE\n"
    fi

else
    printf "HOMEBREW Not Installed\n"
fi