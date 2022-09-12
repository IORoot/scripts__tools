#!/bin/bash

if [ -f /opt/homebrew/bin/gatsby ]; then
    printf "Already Installed\n"
else
    npm install -g gatsby-cli
    printf "DONE\n"
fi