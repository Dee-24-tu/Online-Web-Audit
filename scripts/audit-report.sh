#! /bin/bash

#Keep watch for /var/www/html/Intranet/ for write, read, execute and append changes
#sudo auditctl -w /var/www/html/Intranet/ -k intranet-change #This is executed by cron at system boot every 5 min

timestamp=$(date +"%Y-%m-%d_%H-%M-%S")

LOG_DIR=/var/www/html/logs
sudo mkdir $LOG_DIR &>/dev/null #create the logs dir if it doesn't exist
sudo chmod -R 777 $LOG_DIR #give permission to create dir and append the file

auditlogfile="$LOG_DIR/audit-$timestamp.log" #save file name with time stamp into a variable

echo "Extracting audit logs into $auditlogfile" 
sudo ausearch -l -k intranet-change | aureport -f -i >>$auditlogfile

sudo chmod -R 400 $LOG_DIR

