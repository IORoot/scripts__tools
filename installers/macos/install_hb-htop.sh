#!/bin/bash

# Dependencies

if [ -f "/opt/homebrew/bin/brew" ]; then

    if [ -f /opt/homebrew/bin/htop ]; then
        printf "Already Installed\n"
    else
        brew list htop 1>/dev/null || brew install htop
        printf "DONE\n"
    fi

else
    printf "HOMEBREW Not Installed\n"
fi
