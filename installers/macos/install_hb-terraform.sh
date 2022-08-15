#!/bin/bash

# Dependencies
# pandoc ✘, rust ✘

if [ -f "/opt/homebrew/bin/brew" ]; then

    if [ -d /usr/local/Cellar/terraform@0.12 ]; then
        printf "Already Installed\n"
    else
        brew list terraform@0.12 1>/dev/null || brew install terraform@0.12
        printf "DONE\n"
    fi

else
    printf "HOMEBREW Not Installed\n"
fi
