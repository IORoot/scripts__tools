#!/bin/bash
source cli_colours.sh

# USAGE
# -----------------------------------------------------------
#
# 1. Get 3 variables out, plus ENV Variables set.
#
# ./get_db_details.sh /var/www/vhosts/wordpress/
#
# -----------------------------------------------------------
#
# 2. Get MySQL string format out, plus ENV Variables set.
#
# ./get_db_details.sh /var/www/vhosts/wordpress/ mysql
#
# -----------------------------------------------------------
# 
# 3. Pipe in
#
# ./find_wp_instance.sh wordpress | ./get_db_details.sh mysql  
#


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

    # MYSQL="mysql"
    if [ "$2" == "mysql" ]; then
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
# Accept ALL Arguments
read_wpconfig_variables $PIPE $@