#!/bin/bash


#backup directory
backup_directory="/Backup"

#Get the backup time
time=$(date +"%Y%m%d%H%M%S")

# Backup file name
backup_file="home_backup_$time.tar.gz"

#backup the home directory
tar -czvf "$backup_directory/$backup_file" /home

#check if the backup created or not....
if [ $? -eq 0 ]; then
    echo "Backup created successfully..."
else
    echo "Backup failed.!"
fi