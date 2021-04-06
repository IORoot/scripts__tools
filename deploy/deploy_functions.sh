#!bin/bash

cli_colours() {
    # Terminal Colours
    RED='\033[0;31m'
    GREEN='\033[0;32m'
    BLUE='\033[0;34m'
    CYAN='\033[0;36m'
    GREY='\033[0;90m'
    NC='\033[0m' # No Color
}

# run function to set colours
cli_colours

spinner()
{
    local pid=$!
    local delay=0.75
    local spinstr='|/-\'
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
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


check_wp_config_exists() {
    if [[ ! -f wp-config.php ]]
    then
        cli_text "RED" "Cannot read wp-config.php, Please make sure you are in a root WordPress directory."
        exit 1
    fi
    cli_text "GREEN" "wp-config.php Found."
}



# Read the Wordpress config variables from wp-config
read_wp_config_variables() {
    WPDBNAME=`cat wp-config.php | grep "^define('DB_NAME" | cut -d \' -f 4`
    WPDBUSER=`cat wp-config.php | grep "^define('DB_USER" | cut -d \' -f 4`
    WPDBPASS=`cat wp-config.php | grep "^define('DB_PASSWORD" | cut -d \' -f 4`

    cli_text "${NC}DB:${GREEN}$WPDBNAME" 
    cli_text "${NC}USER:${GREEN}$WPDBUSER" 
    cli_text "${NC}PASS:${GREEN}$WPDBPASS${NC}" 
}



declare_input_filenames() {

    if [[ ! -z "${WPDBNAME}" ]]; 
    then
        DB_FILES=${WPDBNAME}-`date '+%y%m%d'`.sql.gz
        SITE_FILES=${WPDBNAME}-`date '+%y%m%d'`.tar.gz
    fi
    
}


check_user() {
    USER=`whoami`
    cli_text "CYAN" "You will probably need root access for this. You are: "${USER}
}
