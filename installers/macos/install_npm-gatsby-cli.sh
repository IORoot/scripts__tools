#!/bin/bash

if [ -d /usr/local/lib/node_modules/gatsby-cli ]; then
    printf "Already Installed\n"
else
    npm install -g gatsby-cli
    printf "DONE\n"
fi