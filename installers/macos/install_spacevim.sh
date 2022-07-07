#!/bin/bash

if [ -d ~/.SpaceVim ]; then
    printf "Already Installed\n"
else
    curl -sLf https://spacevim.org/install.sh | bash  
    vim
    printf "DONE\n"
fi

