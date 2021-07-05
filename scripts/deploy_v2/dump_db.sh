#!/bin/bash
source cli_colours


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
    printf "${Cyan}You need root access for this. You are: ${USER} \n"
    if [ "$USER" != "root" ]; then
        echo "Not root user. Exit."
        exit 1
    fi
}


set_output_filename() {
    OUTFILE=./${DB_NAME}-`date '+%y%m%d'`.sql
}


dump_database(){
    MYSQL_PWD=${DB_PASS} mysqldump --no-tablespaces -u${DB_USER} ${DB_NAME}  > ${OUTFILE}
}



# Accept a piped input.
if [[ -p /dev/stdin ]]; then
    PIPE=$(cat -)
fi
# All Arguments
ARGS=$@


# List of commands to run
set_variables $PIPE $ARGS
check_variables
check_user
set_output_filename
dump_database