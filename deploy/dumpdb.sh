#!/bin/bash
  

cli_colours() {
    # Terminal Colours
    RED='\033[0;31m'
    GREEN='\033[0;32m'
    BLUE='\033[0;34m'
    CYAN='\033[0;36m'
    GREY='\033[0;90m'
    NC='\033[0m' # No Color
}

# Read the Wordpress config variables from wp-config
read_wp_config_variables() {
    WPDBNAME=`cat wp-config.php | grep "DB_NAME" | cut -d \' -f 4`
    WPDBUSER=`cat wp-config.php | grep "DB_USER" | cut -d \' -f 4`
    WPDBPASS=`cat wp-config.php | grep "DB_PASSWORD" | cut -d \' -f 4`

    cli_text "${NC}DB:${GREEN}$WPDBNAME"
    cli_text "${NC}USER:${GREEN}$WPDBUSER"
    cli_text "${NC}PASS:${GREEN}$WPDBPASS${NC}"
}

create_mysql_filename() {
    OUTFILE=./${WPDBNAME}-`date '+%y%m%d'`.sql
}


dump_database() {
    MYSQL_PWD=${WPDBPASS} mysqldump --no-tablespaces -u${WPDBUSER} ${WPDBNAME}  > ${OUTFILE}
    cli_text "DB Dumped to: ${OUTFILE}"
}

check_user() {
    USER=`whoami`
    cli_text "CYAN" "You will probably need root access for this. You are: "${USER}
}

# Echo to CLI
cli_text() {
    if [ "$#" -eq 1 ]; then
        printf "${NC} $1 \n"
    fi
    if [ "$#" -eq 2 ]; then
        COLOUR=$1
        printf "${!COLOUR} $2 \n"
    fi
}


# Echo Header to CLI
cli_header() {
    printf "${RED} $1 \n"
    echo "----------------------------------------"
}

cli_colours
cli_header "Wordpress MySQL Dump"
check_user
read_wp_config_variables
create_mysql_filename
dump_database