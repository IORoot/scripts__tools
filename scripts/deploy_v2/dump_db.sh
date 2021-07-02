#!/bin/bash
source cli_colours.sh


set_variables(){
    if [[ -n "$1" ]];then
        DB_NAME=$1
    fi

    if [[ -n "$2" ]];then
        DB_USER=$2
    fi

    if [[ -n "$3" ]];then
        DB_PASS=$3
    fi 
}

check_variables(){
    if [[ -z "$DB_NAME" ]] || [[ -z "$DB_USER" ]] || [[ -z "$DB_PASS" ]];then
        echo "$0 [DB_NAME] [DB_USER] [DB_PASS]"
        exit 1
    fi
}




# Accept a piped input.
if [[ -p /dev/stdin ]]; then
    PIPE=$(cat -)
fi
# All
ARGS=$@

# Accept ALL Arguments
set_variables $PIPE $ARGS
check_variables