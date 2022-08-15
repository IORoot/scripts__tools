#!/bin/bash

# Dependencies
# pandoc ✘, rust ✘

if [ -f "/opt/homebrew/bin/brew" ]; then

    if [ -f /opt/homebrew/bin/azure-cli ]; then
        printf "Already Installed\n"
    else
        brew list terraform 1>/dev/null || brew install azure-cli
        printf "DONE\n"
    fi

else
    printf "HOMEBREW Not Installed\n"
fi
