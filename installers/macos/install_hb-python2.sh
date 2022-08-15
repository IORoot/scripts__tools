#!/bin/bash

# Dependencies
# pandoc ✘, rust ✘

if [ -f "/opt/homebrew/bin/brew" ]; then

    if [ -f /opt/homebrew/bin/python2.7 ]; then
        printf "Already Installed\n"
    else
        brew list --cask kamilturek/python2/python@2 1>/dev/null || brew install kamilturek/python2/python@2
        printf "DONE\n"
    fi

else
    printf "HOMEBREW Not Installed\n"
fi