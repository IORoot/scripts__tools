#!/bin/bash

# Dependencies
# pandoc ✘, rust ✘

if [ -f "/opt/homebrew/bin/brew" ]; then

    if [ -f /opt/homebrew/bin/neovim ]; then
        printf "Already Installed\n"
    else
        brew list neovim 1>/dev/null || brew install neovim                  #
        printf "DONE\n"
    fi

else
    printf "HOMEBREW Not Installed\n"
fi