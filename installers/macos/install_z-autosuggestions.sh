#!/bin/bash

if [ -d ~/zsh-autosuggestions ]; then
    printf "Already Installed\n"
else
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
    echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zsh/.zshrc
    printf "DONE\n"
fi
