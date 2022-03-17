#!/bin/bash

if [ -d /usr/local/lib/node_modules/nodemon ]; then
    printf "Already Installed\n"
else
    npm install -g nodemon
    printf "DONE\n"
fi