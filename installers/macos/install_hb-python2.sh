#!/bin/bash

# Dependencies
# pandoc ✘, rust ✘

if [ -f "/usr/local/bin/brew" ]; then

    if [ -d /usr/local/Cellar/python@2/2.7.18 ]; then
        printf "Already Installed\n"
    else
        brew list --cask kamilturek/python2/python@2 1>/dev/null || brew install kamilturek/python2/python@2
        printf "DONE\n"
    fi

else
    printf "HOMEBREW Not Installed\n"
fi