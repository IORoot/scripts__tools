#!/bin/bash

# Dependencies
# pandoc ✘, rust ✘

if [ -f "/usr/local/bin/brew" ]; then

    if [ -L /usr/local/bin/neofetch ]; then
        printf "Already Installed\n"
    else
        brew list neofetch 1>/dev/null || brew install neofetch                  #
        printf "DONE\n"
    fi

else
    printf "HOMEBREW Not Installed\n"
fi