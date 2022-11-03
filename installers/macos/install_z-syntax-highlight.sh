#!/bin/bash

if [ -d ~/.zsh/zsh-syntax-highlighting ]; then
    printf "Already Installed\n"
else
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting                    #
    echo "source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
    printf "DONE\n"
fi