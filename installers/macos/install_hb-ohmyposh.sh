#!/bin/bash

# Dependencies

if [ -f "/opt/homebrew/bin/brew" ]; then

    if [ -f /opt/homebrew/bin/oh-my-posh ]; then
        printf "Already Installed\n"
    else
        brew list oh-my-posh 1>/dev/null || brew install jandedobbeleer/oh-my-posh/oh-my-posh     
        chsh -s $(which zsh)
        printf "DONE\n"
    fi

else
    printf "HOMEBREW Not Installed\n"
fi