#!/bin/bash

if [ -d /usr/local/lib/node_modules/postcss ]; then
    printf "Already Installed\n"
else
    npm install -g postcss postcss-cli
    printf "DONE\n"
fi