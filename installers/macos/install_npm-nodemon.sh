#!/bin/bash

if [ -f /opt/homebrew/bin/nodemon ]; then
    printf "Already Installed\n"
else
    npm install -g nodemon
    printf "DONE\n"
fi