#!/bin/bash

# Dependencies
# pandoc ✘, rust ✘

if [ -f "/usr/local/bin/brew" ]; then

    if [ -L /usr/local/bin/terraform ]; then
        printf "Already Installed\n"
    else
        brew list terraform 1>/dev/null || brew install terraform                  #
        printf "DONE\n"
    fi

else
    printf "HOMEBREW Not Installed\n"
fi