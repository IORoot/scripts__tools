#!/bin/bash

# Dependencies

if [ -f "/opt/homebrew/bin/brew" ]; then

    if [ -f /opt/homebrew/bin/cfssl ]; then
        printf "Already Installed\n"
    else
        brew list cfssl 1>/dev/null || brew install cfssl
        printf "DONE\n"
    fi

else
    printf "HOMEBREW Not Installed\n"
fi
