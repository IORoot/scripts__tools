#!/bin/bash

# Dependencies

if [ -f "/usr/local/bin/brew" ]; then

    if [ -d /usr/local/Cellar/htop ]; then
        printf "Already Installed\n"
    else
        brew list htop 1>/dev/null || brew install htop
        printf "DONE\n"
    fi

else
    printf "HOMEBREW Not Installed\n"
fi
