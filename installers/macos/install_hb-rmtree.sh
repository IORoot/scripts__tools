#!/bin/bash

# Dependencies
# pandoc ✘, rust ✘

if [ -f "/opt/homebrew/bin/brew" ]; then

    if [ -d /opt/homebrew/Library/Taps/beeftornado/homebrew-rmtree ]; then
        printf "Already Installed\n"
    else
        brew list rmtree 1>/dev/null || brew tap beeftornado/rmtree                  #
        printf "DONE\n"
    fi

else
    printf "HOMEBREW Not Installed\n"
fi