#!/bin/bash

# Dependencies

if [ -f "/usr/local/bin/brew" ]; then

    if [ -d /usr/local/Cellar/helm ]; then
        printf "Already Installed\n"
    else
        brew list helm 1>/dev/null || brew install helm
        printf "DONE\n"
    fi

else
    printf "HOMEBREW Not Installed\n"
fi
