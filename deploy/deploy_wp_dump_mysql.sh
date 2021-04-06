#!/bin/bash


# Import common functions.
source deploy_functions.sh   


create_mysql_filename() {
    OUTFILE=/tmp/${WPDBNAME}-`date '+%y%m%d'`.sql.gz
}


dump_database() {
    MYSQL_PWD=${WPDBPASS} mysqldump --no-tablespaces -u${WPDBUSER} ${WPDBNAME}  | gzip > ${OUTFILE} & spinner
    cli_text "DB Dumped to: ${OUTFILE}"
}


cli_header "Wordpress MySQL Dump"
check_user
create_mysql_filename
dump_database