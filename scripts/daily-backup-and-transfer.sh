#!/bin/bash
cd /var/www/html/scripts/ #scripts location

./backup-intranet.sh
./transfer-intranet-to-live.sh
./audit-report.sh

