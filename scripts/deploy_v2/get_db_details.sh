#!/bin/bash
source cli_colours.sh

# Read the Wordpress config variables from wp-config
read_wpconfig_variables() {

    WP_PATH=$1

    if [ -z "$WP_PATH" ]; then
        echo "Please provide a PATH to a valid wordpress wp-config.php file."
    fi

    if [ ! -d "${WP_PATH}" ]; then
        echo "Error: Directory ${WP_PATH} does not exist."
        exit
    fi

    # Set Environment Variables
    export WP_DBNAME=`cat $WP_PATH/wp-config.php | grep "DB_NAME" | cut -d \' -f 4`
    export WP_DBUSER=`cat $WP_PATH/wp-config.php | grep "DB_USER" | cut -d \' -f 4`
    export WP_DBPASS=`cat $WP_PATH/wp-config.php | grep "DB_PASSWORD" | cut -d \' -f 4`


    if [ $2 -eq "mysql" ]; then
        # Echo output the MYSQL String need for connection format
        printf " ${NC}--username=${Cyan}%s ${NC}--password=${Red}%s ${NC}--database=${Orange}%s \n" "${WP_DBUSER}" "${WP_DBPASS}" "${WP_DBNAME}"
    else
        # Echo DB Username Password
        printf "%s %s %s \n" "${WP_DBUSER}" "${WP_DBPASS}" "${WP_DBNAME}"
    fi
    
}

# Accept a piped input.
if [[ -p /dev/stdin ]]; then
    PIPE=$(cat -)
fi

# Either the pipe or argument 1.
if [ $# -eq 0 ] ; then
    read_wpconfig_variables $PIPE
else
    read_wpconfig_variables $1
fi