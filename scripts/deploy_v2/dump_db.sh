#!/bin/bash
source cli_colours.sh


override_env_variables(){

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


check_parameters(){

    if [ "$#" -ne 3 ]; then
        echo "$0 [DB_NAME] [DB_USER] [DB_PASS]"
        exit 1
    fi

}



# Accept a piped input.
if [[ -p /dev/stdin ]]; then
    PIPE=$(cat -)
fi


# Accept ALL Arguments
override_env_variables
check_parameters