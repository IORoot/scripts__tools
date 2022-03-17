#!/bin/bash

# Dependencies
# pandoc ✘, rust ✘

if [ -f "/usr/local/bin/brew" ]; then

    if [ -L /usr/local/bin/nmap ]; then
        printf "Already Installed\n"
    else
        brew list nmap 1>/dev/null || brew install nmap                  #
        printf "DONE\n"
    fi

else
    printf "HOMEBREW Not Installed\n"
fi