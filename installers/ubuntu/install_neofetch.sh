#!/bin/bash

if [ -f "/usr/local/bin/neofetch" ]; then
    printf "Already Installed\n"
else
    sudo apt update
    sudo apt install neofetch                #
    printf "DONE\n"
fi