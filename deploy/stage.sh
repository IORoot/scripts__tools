#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "$0 [ENV]"
    exit 1
fi

ENV=$1

cd ~/vagrant/${ENV}

CMD="cd /var/www/vhosts/${ENV}; dumpdb;"

vagrant ssh -c "${CMD}"

sudo mv ~/code/LondonParkour.com/${ENV}/wp-content/database/*.sql ~/code/LondonParkour.com/DEPLOY/STAGING/wp-content/database/