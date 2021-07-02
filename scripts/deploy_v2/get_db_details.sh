#!/bin/bash

source cli_colours.sh


# Read the Wordpress config variables from wp-config
read_wpconfig_variables() {
    WP_PATH=$1

    echo $WP_PATH

    if [ ! -d "${WP_PATH}" ]; then
        echo "Error: Directory ${WP_PATH} does not exist."
        exit
    fi

    export WP_DBNAME=`cat $WP_PATH/wp-config.php | grep "DB_NAME" | cut -d \' -f 4`
    export WP_DBUSER=`cat $WP_PATH/wp-config.php | grep "DB_USER" | cut -d \' -f 4`
    export WP_DBPASS=`cat $WP_PATH/wp-config.php | grep "DB_PASSWORD" | cut -d \' -f 4`

    printf "${NC}Database:${Orange} %-30s ${NC}| Username:${Cyan} %-20s ${NC}| Password:${Red} %-20s \n" "${WP_DBNAME}" "${WP_DBUSER}" "${WP_DBPASS}"
}


if [[ -p /dev/stdin ]]; then
    PIPE=$(cat -)
fi

if [ $# -eq 0 ] ; then
    read_wpconfig_variables $PIPE
else
    read_wpconfig_variables $1
fi