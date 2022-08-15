#!/bin/bash

# Dependencies
# openssl@1.1 ✘

if [ -f "/opt/homebrew/bin/brew" ]; then

    if [ -f /opt/homebrew/bin/git-crypt ]; then
        printf "Already Installed\n"
    else
        brew list git-crypt 1>/dev/null || brew install git-crypt                  #
        printf "DONE\n"
    fi

else
    printf "HOMEBREW Not Installed\n"
fi