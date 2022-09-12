#!/bin/bash

if [ -f /opt/homebrew/bin/postcss ]; then
    printf "Already Installed\n"
else
    npm install -g postcss postcss-cli
    printf "DONE\n"
fi