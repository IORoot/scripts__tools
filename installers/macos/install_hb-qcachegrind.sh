#!/bin/bash

# Dependencies
# pandoc ✘, rust ✘

if [ -f "/usr/local/bin/brew" ]; then

    if [ -d /usr/local/Cellar/qcachegrind ]; then
        printf "Already Installed\n"
    else
        brew list qcachegrind 1>/dev/null || brew install qcachegrind
        printf "DONE\n"
    fi

else
    printf "HOMEBREW Not Installed\n"
fi