#!/bin/bash

if [ -f "/usr/bin/neofetch" ]; then
    printf "Already Installed\n"
else
    sudo apt update
    sudo apt -y install neofetch                #
    printf "DONE\n"
fi