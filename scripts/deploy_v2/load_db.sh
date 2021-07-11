#!/bin/bash

source cli_colours

# Usage:
# load_db [user] [password] [database]
# load_db $(read_wp_config .)

# All Arguments
ARGS=$@
PWD=$(/bin/pwd)



set_variables(){

    if [[ -n "$1" ]];then
        DB_USER=$1
    fi

    if [[ -n "$2" ]];then
        DB_PASS=$2
    fi 

    if [[ -n "$3" ]];then
        DB_NAME=$3
    fi
}


check_variables(){
    if [[ -z "$DB_NAME" ]] || [[ -z "$DB_USER" ]] || [[ -z "$DB_PASS" ]];then
        echo "load_db [user] [password] [database]"
        echo "or while in WP root directory, use: load_db \$(read_wp_config .)"
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

    if ! ls $PWD/wp-content/database/$DB_NAME.sql 1> /dev/null 2>&1; then
        echo "SQL File ${DB_NAME}.sql not found"
        exit 1
    fi
}


check_db() {
    RESULT=`mysqlshow $DB_NAME| grep -v Wildcard | grep -o $DB_NAME`
    if [ "$RESULT" == $DB_NAME ]; then
        echo "Database '$DB_NAME' Exists"
    else
        echo "Database '$DB_NAME' does not exist."
    fi
}



load_db() {
    mysql -h localhost ${DB_NAME} < $PWD/wp-content/database/$DB_NAME.sql
}


# List of commands to run
set_variables $ARGS
check_variables
check_user
check_for_sql_file
check_db
load_db