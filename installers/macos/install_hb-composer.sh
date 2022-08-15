#!/bin/bash

# Dependencies
# pandoc ✘, rust ✘

if [ -f "/opt/homebrew/bin/brew" ]; then

    if [ -f /opt/homebrew/bin/composer ]; then
        printf "Already Installed\n"
    else
        brew list composer 1>/dev/null || brew install composer                  #
        printf "DONE\n"
    fi

else
    printf "HOMEBREW Not Installed\n"
fi