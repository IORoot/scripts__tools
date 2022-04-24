#!/bin/bash

# Dependencies
# pandoc ✘, rust ✘

if [ -f "/usr/local/bin/brew" ]; then

    if [ -d /usr/local/Cellar/kubernetes-cli ]; then
        printf "Already Installed\n"
    else
        brew list kubectl 1>/dev/null || brew install kubectl
        printf "DONE\n"
    fi

else
    printf "HOMEBREW Not Installed\n"
fi
