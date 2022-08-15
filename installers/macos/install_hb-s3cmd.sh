#!/bin/bash

# Dependencies
# pandoc ✘, rust ✘

if [ -f "/opt/homebrew/bin/brew" ]; then

    if [ -f /opt/homebrew/bin/s3cmd ]; then
        printf "Already Installed\n"
    else
        brew list s3cmd 1>/dev/null || brew install s3cmd                  #
        printf "DONE\n"
    fi

else
    printf "HOMEBREW Not Installed\n"
fi