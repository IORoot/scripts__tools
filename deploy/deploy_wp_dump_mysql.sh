#!/bin/bash

# Terminal Colours
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
GREY='\033[0;90m'
NC='\033[0m' # No Color




# Echo to CLI
cli_text() {
    if [ "$#" -eq 1 ]; then
        printf " - ${NC} $1 \n"
    fi
    if [ "$#" -eq 2 ]; then
        COLOUR=$1
        printf " - ${!COLOUR} $2 \n"
    fi
}

# Echo Header to CLI
cli_header() {
    printf "${RED}Wordpress MySQL Dump \n"
    echo "----------------------------------------"
}



check_wp_config_exists() {
    if [[ ! -f wp-config.php ]]
    then
        cli_text "RED" "Cannot read wp-config.php, Please make sure you are in a root WordPress directory."
        exit 1
    fi
    cli_text "GREEN" "wp-config.php Found."
}


read_wp_config_variables() {
    WPDBNAME=`cat wp-config.php | grep DB_NAME | cut -d \' -f 4`
    WPDBUSER=`cat wp-config.php | grep DB_USER | cut -d \' -f 4`
    WPDBPASS=`cat wp-config.php | grep DB_PASSWORD | cut -d \' -f 4`

    cli_text "BLUE" "${BLUE}DB:${GREEN}$WPDBNAME ${BLUE}USER:${GREEN}$WPDBUSER ${BLUE}PASS:${GREEN}$WPDBPASS" 
}


create_mysql_filename() {
    OUTFILE=/tmp/${WPDBNAME}-`date '+%m%d%y'`.sql.gz
}


dump_database() {
    mysqldump -u${WPDBUSER} -p${WPDBPASS} ${WPDBNAME}  | gzip > ${OUTFILE}
    cli_text "DB Dumped to: ${OUTFILE}"
}


cli_header
check_wp_config_exists
read_wp_config_variables
create_mysql_filename
dump_database