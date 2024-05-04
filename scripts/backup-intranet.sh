#!/bin/bash

# Create a variable to be the signature stamp for finame purposes
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_SOURCE_PATH="/var/www/html/Intranet/"
sudo mkdir /var/www/html/Backups &>/dev/null #create backup directory if it doesn't exist
BACKUP_DESTINATION="/var/www/html/Backups/Intranet-backup-$timestamp.zip"

# Change permissions so no one can edit the file
sudo chmod -R 000 $BACKUP_SOURCE_PATH

# Save backup into a compressed file with time stamp on it and move to another folder
echo "Backing up $BACKUP_SOURCE_PATH into $BACKUP_DESTINATION"
sudo zip -r -q $BACKUP_DESTINATION $BACKUP_SOURCE_PATH

# Change permissions back to normal  
sudo chmod -R 744 $BACKUP_SOURCE_PATH

echo ""

