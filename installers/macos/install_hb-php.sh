#!/bin/bash

# Dependencies
# pandoc ✘, rust ✘

if [ -f "/opt/homebrew/bin/brew" ]; then

    if [ -f /opt/homebrew/bin/php ]; then
        printf "Already Installed\n"
    else
        brew list php 1>/dev/null || brew install php                  #
        printf "DONE\n"
    fi

else
    printf "HOMEBREW Not Installed\n"
fi