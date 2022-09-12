#!/bin/bash

if [ -d /opt/homebrew/bin/yarn ]; then
    printf "Already Installed\n"
else
    npm install -g yarn
    printf "DONE\n"
fi