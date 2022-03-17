#!/bin/bash

if [ -d ~/.oh-my-zsh ]; then
    printf "Already Installed\n"
else
    /bin/sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    printf "DONE\n"
fi