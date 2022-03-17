#!/bin/bash

colours(){
    # Reset
    NC='\033[0m'                  # NO Colour (reset)

    # Regular Colors
    Black='\033[0;30m'         # Black
    Red='\033[0;31m'           # Red
    Green='\033[0;32m'         # Green
    Yellow='\033[0;33m'        # Yellow
    Orange='\033[0;34m'        # Orange
    Purple='\033[0;35m'        # Purple
    Cyan='\033[0;36m'          # Cyan
    White='\033[0;37m'         # White

    # High Intensity
    I_Black='\033[0;90m'       # Black
}
colours

# Node Spec
NODE_NAME=$(hostname)
NODE_DISTRO=$(uname -a | awk '{print $4}')





# MacOS
macos(){
    LOCAL_IP=$(ifconfig | grep "inet " | grep -v "127.0.0.1" | head -1 | awk '{print $2}')
    PUBLIC_IP=$(curl -sS ifconfig.me)

    # Node Metrics
    UPTIME=$(uptime | awk -F "," '{print $1}')
    LOAD=$(uptime | awk -F ":" '{print $4}')
    HDD=$(df -H | sort | head -1 | awk '{print $2 "/"  $3}')

}


ubuntu(){
    LOCAL_IP=$(hostname -I | awk '{print $2}')
    PUBLIC_IP=$(curl -sS ifconfig.me)

    # Node Metrics
    UPTIME=$(uptime | awk -F "," '{print $1}')
    LOAD=$(uptime | awk -F ":" '{print $5}')
    HDD=$(df -H | sort | head -1 | awk '{print $2 "/"  $3}')

    # PHP
    PHP_VER=$(php -v | head -1 | cut -c 5-10)
    PHP_SHORT_VER=$(php -v | head -1 | cut -c 5-7)
    PHP_STATE=$(systemctl status php$PHP_SHORT_VER-fpm.service | grep "Active" | awk '{print $2}')

    # MYSQL
    MYSQL_STATE=$(systemctl status mysql.service | grep "Active" | awk '{print $2}')
    MYSQL_VER=$(mysql --version | awk '{print $3}')

    # APACHE
    APACHE_STATE=$(systemctl status apache2.service | grep "Active" | awk '{print $2}')
    APACHE_VER=$(apache2 -v | head -1 | awk '{print $3}' )

    # PUPPET
    PUPPET_VER=$(puppet --version)
    PUPPET_RAN=$(head -n3 /opt/puppetlabs/puppet/cache/state/last_run_report.yaml 2> /dev/null | grep "time" | awk -F "'" '{print $2}' | cut -c 1-16)
}



# Make the line 80chars long, no matter the title length.
title(){

    TITLE=$1
    COUNT=${#TITLE}
    let "LENGTH = (80-$COUNT)/2"
    for ((i=1; i<=$LENGTH; i++)); do
        printf "${I_Black}-"
    done

    printf "${Red} $TITLE "

    for ((i=1; i<=$LENGTH; i++)); do
        printf "${I_Black}-"
    done
    
    printf "\n"
}



# LOGO

output_node()
{
    # NODE
    title "${NODE_NAME}"
    printf "${I_Black}HOST: ${Cyan}%-40s ${I_Black} UP  :${Green} %-40s\n" "${NODE_NAME}"      "${UPTIME}"
    printf "${I_Black}OS  : ${Cyan}%-40s ${I_Black} CPU :${Green}%-40s\n"  "${NODE_DISTRO}"    "${LOAD}"
    printf "${I_Black}PUB : ${Cyan}%-40s ${I_Black} HDD :${Green} %-40s\n" "${LOCAL_IP}"       "${HDD}"
    printf "${I_Black}PRI : ${Cyan}%-40s ${I_Black} MEM :${Green}%-40s\n"  "${PUBLIC_IP}"      "${MEM}"
}

output_services()
{
    # SERVICES
    title "Services"
    printf "${I_Black}PHP : ${Cyan}%-40s ${I_Black} STATE :${Green} %-40s\n" "${PHP_VER}" "${PHP_STATE}"
    printf "${I_Black}MSQL: ${Cyan}%-40s ${I_Black} STATE :${Green} %-40s\n" "${MYSQL_VER}" "${MYSQL_STATE}" 
    printf "${I_Black}WEB : ${Cyan}%-40s ${I_Black} STATE :${Green} %-40s\n" "${APACHE_VER}" "${APACHE_STATE}"
    printf "${I_Black}PUPP: ${Cyan}%-40s ${I_Black} RAN   :${Green} %-40s\n" "${PUPPET_VER}" "${PUPPET_RAN}"
}

helpme(){
    title "Help"
    printf "${I_Black}HELP: ${Orange}'help' will list custom scripts. 'cheat' for command cheatsheet.\n"
}

if [[ $NODE_DISTRO == *"Darwin"* ]]; then
    macos;
    output_node;
    helpme;
    title "◣◥";
elif [[ $NODE_DISTRO == *"Ubuntu"* ]]; then
    ubuntu;
    output_node;
    output_services;
    helpme;
    title "◣◥";
fi