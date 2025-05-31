#!/bin/bash

# Your task is to write a bash script which will take compressed (tar) copy of the entire application directory (/var/www/html)
#  and save it under /backups directory. Ensure each backup is timestamped.

backup_dir="/backups"
if [ ! -d "$backup_dir" ]; then
    sudo mkdir -p "$backup_dir"
fi


timestamp=$(date)
backup_file="apache_backup_$timestamp.tar.gz"

sudo tar -czf "$backup_dir/$backup_file" /var/www/html
echo "all the files in apache are archived in $backup_dir folder"

