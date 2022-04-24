#!/bin/bash

# Dependencies
# pandoc ✘, rust ✘

if [ -f "/usr/local/bin/brew" ]; then

    if [ -d /usr/local/Cellar/kubectx ]; then
        printf "Already Installed\n"
    else
        brew list kubectx 1>/dev/null || brew install kubectx
        printf "DONE\n"
    fi

else
    printf "HOMEBREW Not Installed\n"
fi
