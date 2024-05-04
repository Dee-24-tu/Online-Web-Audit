#! /bin/bash

create_user(){
   read -p "Enter new username: " username
   
   # Checks if the name already exist within files
   id "$username" &>/dev/null
   USER_CHECK_RESULT=$?
   if [ $USER_CHECK_RESULT -eq 0 ]; then
   	echo "User '$username' already exists. ****"
   else
       sudo useradd -m -s /bin/bash "$username"
       # Password is required to enter twice as is rejected for the first time
       sudo passwd $username       
       echo "New user '$username' created and added."
   fi
}

run_backup(){
    ./backup-intranet.sh
}

transfer_changes(){
    # Sync changes made in each file into Live folders 
    ./transfer-intranet-to-live.sh
}

user_activity(){
    ./audit-report.sh
}

health_check(){
    ./system-health-report.sh
}

text_input=""
while  [  "$text_input" != "Exit"  ]
do
    clear
    echo "********Select the operation********"
    echo "  1) Create a user"
    echo "  2) Delete a user"
    echo "  3) Run back up"
    echo "  4) Transfer Live"
    echo "  5) View user logs"
    echo "  6) Check System Health"
    echo "  7) Exit"
    echo "***********************************"
   
    read userInput

    case $userInput in
        1)  echo "Creating New User"
        create_user
        ;;
        2)  echo "Deleting User Details"
        sudo deluser --remove-home
        ;;
        3)  echo "Running Backup"
        run_backup
        ;;
        4)  echo "Transfering Live"
        transfer_changes
        ;;
        5)  echo "Running User Logs"
        user_activity
        echo "User activity log complete."
        ;;
        6)  echo "Running System Health Check"
        health_check
        ;;
        7)  echo "Closing...";
        break
        ;;
        *)  echo "Invalid Option";;
    esac
    
    echo ""
    echo  "Press any key to continue... "
    
    read key
    sleep 1
done 
    
