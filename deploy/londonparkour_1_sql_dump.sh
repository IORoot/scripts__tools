#!/bin/bash
mysqldump -u root -p londonparkour_dev  | gzip > /Users/andrewpearson/vagrant/dev.londonparkour.com/londonparkour_mysql.sql.gz