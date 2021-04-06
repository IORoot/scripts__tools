#!/bin/bash


# Import common functions.
source deploy_functions.sh   


read_wp_config_variables() {
    WPDBNAME=`cat wp-config.php | grep "^define('DB_NAME" | cut -d \' -f 4`
    WPDBUSER=`cat wp-config.php | grep "^define('DB_USER" | cut -d \' -f 4`
    WPDBPASS=`cat wp-config.php | grep "^define('DB_PASSWORD" | cut -d \' -f 4`

    cli_text "${NC}DB:${GREEN}$WPDBNAME" 
    cli_text "${NC}USER:${GREEN}$WPDBUSER" 
    cli_text "${NC}PASS:${GREEN}$WPDBPASS${NC}" 
}


create_mysql_filename() {
    OUTFILE=/tmp/${WPDBNAME}-`date '+%y%m%d'`.sql.gz
}


dump_database() {
    mysqldump --no-tablespaces -u${WPDBUSER} -p${WPDBPASS} ${WPDBNAME}  | gzip > ${OUTFILE} & spinner
    cli_text "DB Dumped to: ${OUTFILE}"
}


cli_header "Wordpress MySQL Dump"
check_wp_config_exists
check_user
read_wp_config_variables
create_mysql_filename
dump_database