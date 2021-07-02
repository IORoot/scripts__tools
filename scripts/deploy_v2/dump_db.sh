#!/bin/bash
source cli_colours.sh


override_env_variables(){

    echo "one=$1\n"
    if [[ -n "$1" ]];then
        DB_NAME=$1
    fi

    echo "two=$2\n"
    if [[ -n "$2" ]];then
        DB_USER=$2
    fi

    echo "three=$3\n"
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

echo "one=$1\n"
echo "two=$2\n"
echo "three=$3\n"
echo "all=$@"
echo "PIPE=$PIPE"
# Accept ALL Arguments
override_env_variables
check_parameters