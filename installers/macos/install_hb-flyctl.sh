#!/bin/bash

# Dependencies
# pandoc ✘, rust ✘

if [ -f "/usr/local/bin/brew" ]; then

    if [ -d /usr/local/Cellar/flyctl ]; then
        printf "Already Installed\n"
    else
        brew list flyctl 1>/dev/null || brew install flyctl                  #
        printf "DONE\n"
    fi

else
    printf "HOMEBREW Not Installed\n"
fi