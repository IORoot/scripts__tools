#!/bin/bash

# Dependencies
# pandoc ✘, rust ✘

if [ -f "/opt/homebrew/bin/brew" ]; then

    if [ -f /opt/homebrew/bin/kubectx ]; then
        printf "Already Installed\n"
    else
        brew list kubectx 1>/dev/null || brew install kubectx
        printf "DONE\n"
    fi

else
    printf "HOMEBREW Not Installed\n"
fi
