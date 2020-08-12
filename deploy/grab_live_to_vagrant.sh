#!/bin/bash

if [ "$#" -ne 0 ]; then
  echo "Usage: $0 " >&2
  exit 1
fi

echo "Grabbing files on LIVE server /tmp directory"
scp root@londonparkour.com:/tmp/londonparkour* /Users/andrewpearson/Downloads

echo "Moving existing wp-content to wp-content-old"
mv /Users/andrewpearson/Storage/Code/VMs/dev.londonparkour.com/dev.londonparkour.com/wp-content wp-content-old

echo "Copying tars into wordpress directory"
cp /Users/andrewpearson/Downloads/londonparkour* /Users/andrewpearson/Storage/Code/VMs/dev.londonparkour.com/dev.londonparkour.com/

echo "Untarring wp-content"
tar -xf /Users/andrewpearson/Storage/Code/VMs/dev.londonparkour.com/dev.londonparkour.com/londonparkour_wp-contents.tar.gz

echo "removing TAR file"
rm /Users/andrewpearson/Storage/Code/VMs/dev.londonparkour.com/dev.londonparkour.com/londonparkour_wp-contents.tar.gz

echo "Run DB import on vagrant using 'mysql -u root  -ptoor londonparkour < londonparkour_mysql.sql'"