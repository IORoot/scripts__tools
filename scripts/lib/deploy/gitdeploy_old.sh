#!/bin/bash

if [ -z $1 ]; then 
    BRANCH="master"
else 
    BRANCH=$1;
fi

cd ~/code/LondonParkour.com/DEPLOY/londonparkour.com

stage.sh dev.londonparkour.com

git submodule update --recursive --remote

git add .

git commit -m "deploy to ${BRANCH} branch"

git push origin $BRANCH

echo "Post-Deploy Tasks."
echo "1. Manually login to GCal Sync OAUTH."
echo "2. Enter License into WP Real Media Library Plugin."