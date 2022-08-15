#!/bin/bash

# Dependencies

if [ -f "/opt/homebrew/bin/brew" ]; then

    if [ -f /opt/homebrew/bin/zsh ]; then
        printf "Already Installed\n"
    else
        brew list zsh 1>/dev/null || brew install zsh     
        chsh -s $(which zsh)
        printf "DONE\n"
    fi

else
    printf "HOMEBREW Not Installed\n"
fi