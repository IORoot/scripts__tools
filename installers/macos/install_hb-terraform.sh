#!/bin/bash

# Dependencies
# pandoc ✘, rust ✘

if [ -f "/opt/homebrew/bin/brew" ]; then

    if [ -f /opt/homebrew/bin/terraform ]; then
        printf "Already Installed\n"
    else
        brew list terraform 1>/dev/null || brew install terraform
        printf "DONE\n"
    fi

else
    printf "HOMEBREW Not Installed\n"
fi
