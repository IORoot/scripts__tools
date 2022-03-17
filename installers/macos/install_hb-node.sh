#!/bin/bash

# Dependencies
# pandoc ✘, rust ✘

if [ -f "/usr/local/bin/brew" ]; then

    if [ -L /usr/local/bin/node ]; then
        printf "Already Installed\n"
    else
        brew list node 1>/dev/null || brew install node                  #
        printf "DONE\n"
    fi

else
    printf "HOMEBREW Not Installed\n"
fi