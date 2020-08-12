#!/bin/bash

if [ "$#" -ne 0 ]; then
  echo "Usage: $0 " >&2
  exit 1
fi

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


echo "[vagrant] - Dumping DB to wordpress wp-content directory"
cd /Users/andrewpearson/Storage/Code/VMs/dev.londonparkour.com/dev.londonparkour.com
vagrant ssh -- -t 'sudo mysqldump -u root -ptoor londonparkour  | gzip > /var/www/vhosts/dev.londonparkour.com/wp-content/vagrant_londonparkour_mysql_`date '+%m%d%y'`.sql.gz' & spinner

echo "[vagrant] - Tarzip wordpress wp-content directory in /tmp"
tar -czf /tmp/deploy_londonparkour-`date '+%m%d%y'`.tar.gz /Users/andrewpearson/Storage/Code/VMs/dev.londonparkour.com/dev.londonparkour.com/wp-content --exclude='debug.log' --exclude='instamancer.log' --exclude='/cache' & spinner

echo "[vagrant] - Copy Tarzip to Remote staging server"
scp /tmp/deploy_londonparkour-`date '+%m%d%y'`.tar.gz root@londonparkour.com:/tmp

echo "[Staging] - Move Tarzip Wordpress directory"
ssh -t root@londonparkour.com 'mv /tmp/deploy_londonparkour* /var/www/vhosts/staging.londonparkour.com'

echo "Complete"