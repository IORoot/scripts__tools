#!/bin/bash

source cli_colours.sh

# Sets the ENV Variables.
if [ "$#" -ne 1 ]; then
    echo -e "$0 [DIR] - ${Orange} WordPress directory that contains wp-config.php"
    exit 1
fi

WPPATH=$1

move_into_dir(){
    if [ -d "${WPPATH}" ] 
    then
        cd $WPPATH
    else
        echo "Error: Directory ${WPPATH} does not exist."
        exit
    fi
}


# Read the Wordpress config variables from wp-config
read_wpconfig_variables() {
    export WP_DBNAME=`cat $WPPATH/wp-config.php | grep "DB_NAME" | cut -d \' -f 4`
    export WP_DBUSER=`cat $WPPATH/wp-config.php | grep "DB_USER" | cut -d \' -f 4`
    export WP_DBPASS=`cat $WPPATH/wp-config.php | grep "DB_PASSWORD" | cut -d \' -f 4`

    printf "${NC}Database: ${Orange} %-30s ${NC}| Username: ${Cyan} %-20s ${NC}| Password: ${Red} %-20s \n" "${WP_DBNAME}" "${WP_DBUSER}" "${WP_DBPASS}" 
}

move_into_dir
read_wpconfig_variables