#!/bin/bash

# Dependencies
# pandoc ✘, rust ✘

if [ -f "/opt/homebrew/bin/brew" ]; then

    if [ -f /opt/homebrew/bin/kubectl ]; then
        printf "Already Installed\n"
    else
        brew list kubectl 1>/dev/null || brew install kubectl
        printf "DONE\n"
    fi

else
    printf "HOMEBREW Not Installed\n"
fi
