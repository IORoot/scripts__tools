#!/bin/bash

# Dependencies
# pandoc ✘, rust ✘

if [ -f "/usr/local/bin/brew" ]; then

    if [ -d /usr/local/Cellar/kubernetes-cli ]; then
        printf "Already Installed\n"
    else
        brew list terraform 1>/dev/null || brew install kubernetes-cli
        printf "DONE\n"
    fi

else
    printf "HOMEBREW Not Installed\n"
fi
