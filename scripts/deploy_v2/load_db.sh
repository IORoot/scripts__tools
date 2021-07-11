#!/bin/bash

source cli_colours


# Accept a piped input.
if [[ -p /dev/stdin ]]; then
    PIPE=$(cat -)
fi

# All Arguments
ARGS=$@
PWD=$(/bin/pwd)



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


check_user() {
    USER=`whoami`
    if [ "$USER" != "root" ]; then
        printf "${Cyan}You need root access for this. You are: ${USER} \n"
        exit 1
    fi
}


check_for_sql_file() {
    if [[ ! -d "$PWD/wp-content/database" ]];then
        echo "no /wp-content/database directory found."
        exit 1
    fi

    if ! ls $PWD/wp-content/database/*.sql 1> /dev/null 2>&1; then
        echo "SQL File not found"
        exit 1
    fi
}


create_db() {
    RESULT=`mysqlshow $DB_NAME| grep -v Wildcard | grep -o $DB_NAME`
    if [ "$RESULT" == $DB_NAME ]; then
        echo "Database Exists"
    else
        echo "Database does not exist. Creating"
    fi
}


# List of commands to run
set_variables $PIPE $ARGS
check_variables
check_user
check_for_sql_file