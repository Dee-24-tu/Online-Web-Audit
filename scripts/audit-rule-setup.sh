#!/bin/bash

RULE_PRESENT=$(sudo auditctl -l | grep -c -F "/var/www/html/Intranet") #saves "1" if audit rule is already set up

if [ $RULE_PRESENT -ne 1 ] #if the rule does not exist then create the rule
then
    sudo auditctl -w /var/www/html/Intranet/ -k intranet-change
fi

