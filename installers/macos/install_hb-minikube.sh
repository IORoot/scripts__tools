#!/bin/bash

# Dependencies
# pandoc ✘, rust ✘

if [ -f "/usr/local/bin/brew" ]; then

    if [ -d /usr/local/Cellar/minikube ]; then
        printf "Already Installed\n"
    else
        brew list minikube 1>/dev/null || brew install minikube
        printf "DONE\n"
    fi

else
    printf "HOMEBREW Not Installed\n"
fi
