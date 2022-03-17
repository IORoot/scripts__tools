#!/bin/bash


# EXAMPLE: variable_replace .zshrc ZSH_THEME robbyrussell
variable_replace()
{
    if [ "$#" -ne 3 ]; then
        exit 1
    fi

    FILE=$1
    VARIABLE=$2
    REPLACE=$3

    if [ ! -f $FILE ]; then
        exit 1
    fi

    STRING="s;${VARIABLE}=\".*\";${VARIABLE}=\"${REPLACE}\";g";

    sed -i -e $STRING $FILE
}