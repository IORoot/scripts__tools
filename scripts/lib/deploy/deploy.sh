#!/bin/bash


# Import common functions
source deploy_functions.sh


print_usage()
{
    cli_header "deploy -[adscmo]"
    cli_text "-a = ALL Functions"
    cli_text "-d = Dump MySQL to /tmp"
    cli_text "-s = Dump Source Files to /tmp"
    cli_text "-c = Copy to target"
    cli_text "-m = Move to vHost"
    cli_text "-o = Open tar.gz"
    cli_text ""

    cli_header ".deploy.json in root WP Folder."
    cli_text "{    
    "target": "londonparkour.com",                             
    "vhost":  "staging.londonparkour.com", 
    "source": [
        "/wp-config.php",
        "/wp-content"
    ]   
}"
    cli_text ""

    cli_header "Requires"
    cli_text "jq tool -  sudo apt-get install jq"

    
}

if [ "$#" -ne 1 ]; then
    print_usage >&2
    exit 1
fi


while getopts 'dscmoa' flag; do
    case "${flag}" in
        d) dump_flag='true' ;;
        s) site_flag='true' ;;
        c) copy_flag='true' ;;
        m) move_flag='true' ;;
        o) open_flag='true' ;;
        a) all_flags='true' ;;
        *) print_usage
            exit 1 ;;
    esac
done


check_wp_config_exists
read_wp_config_variables

# read .deploy.json file
source deploy_read_config.sh

# dump mysql
if [[ ! -z "${dump_flag}" || ! -z "${all_flags}" ]]; then
    source deploy_wp_dump_mysql.sh
fi

# dump wordpress files
if [[ ! -z "${site_flag}" || ! -z "${all_flags}" ]]; then
    source deploy_wp_dump_site.sh
fi

# rsync
if [[ ! -z "${copy_flag}" || ! -z "${all_flags}" ]]; then
    source deploy_wp_copy_to_live.sh
fi

# move files to vhost
if [[ ! -z "${move_flag}" || ! -z "${all_flags}" ]]; then
    source deploy_wp_move_to_vhost.sh
fi

# untar files
if [[ ! -z "${open_flag}" || ! -z "${all_flags}" ]]; then
    source deploy_wp_gunzip_remote_files.sh
fi