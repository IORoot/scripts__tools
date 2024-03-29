#!/bin/bash

# Dependencies
# pandoc ✘, rust ✘

if [ -f "/opt/homebrew/bin/brew" ]; then

    if [ -f /opt/homebrew/bin/minikube ]; then
        printf "Already Installed\n"
    else
        brew list minikube 1>/dev/null || brew install minikube
        printf "DONE\n"
    fi

else
    printf "HOMEBREW Not Installed\n"
fi
