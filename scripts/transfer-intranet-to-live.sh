#!/bin/bash
echo "Transferring changes from Intranet to Live"
SOURCE_PATH=/var/www/html/Intranet/
DESTINATION_PATH=/var/www/html/Live/
sudo rsync -av $SOURCE_PATH $DESTINATION_PATH

