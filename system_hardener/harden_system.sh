#!/bin/bash

#================== CONFIGURATION ====================
# Define SSH connectio variables

# For test purpouses I created Ubuntu VM
# In your case you have to configure the script  
# for your needs.
remote_server=192.168.1.147
ssh_user=oliwa
ssh_key=/home/oliwa/.ssh/id_rsa.pub

#==================== FUNCTIONS ======================

function connection_test() {
    echo "$(date) - [TEST] Executing bash function remotelly over ssh." >> connection_test.txt
}

function setup_password_policie() {
    # Configure password policies in the pwquality.conf
    policies_conf=/etc/security/pwquality.conf

    # Password Quality Requirements. 
    # Each element contains "item value" pair.
    config_items=(
    "minlen 8" 
    "minclass 3" 
    "minrepeat 3" 
    "maxrepeat 2" 
    "maxsequence 3")

    for item in "${config_items[@]}"; do
        # Split each item into two parts using dalimiter (space)
        IFS=" " read -r item_name item_value <<< "$item"

        pattern="^$item_name=.*"
        if grep -q "$pattern" "$policies_conf"; then
            # Replace existing row with the new value
            echo "$item_name found in file! New value set!"
            sed -i "s/$pattern/$item_name=$item_value/" $policies_conf
        else
            # If there is no matching pattern in conf file append new row
            echo "Appended $item_name to the config file."
            echo "$item_name=$item_value" >> "$policies_conf"
        fi
    done
}

function setup_firewall_rules() {
    # Set up a firewall to filter incoming and outgoing traffic
    # Use ufw or iptables command to create rules that allow only necessary network traffic

    # Set a default policy
    # -------------------------------------------------------------------------------
    # Denies all traffic by default = improving security by blocking incoming traffic 
    # unless specifically allowed by firewall rules.
    iptables -P INPUT DROP
    # Allow the server to initiate connections
    iptables -P OUTPUT ACCEPT
    # -------------------------------------------------------------------------------

    # Allow Necessary Services - allow incoming traffic only on ports required for your services
    # ------------------------------------------------------------------------------------------
    # Basic statefull rules - feel free to add more
    # ------------------------------------------------------------------------------------------
    # Accept packets in NEW and ESTABLISHED state for incomming connection
    # Accept packets in ESTABLISHED state for outgoing connections
    # For SSH
    iptables -A INPUT -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
    iptables -A OUTPUT -p tcp --sport 22 -m state --state ESTABLISHED -j ACCEPT
    # For HTTP
    iptables -A INPUT -p tcp --dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT
    iptables -A OUTPUT -p tcp --sport 80 -m state --state ESTABLISHED -j ACCEPT
    # For HTTPS
    iptables -A INPUT -p tcp --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT
    iptables -A OUTPUT -p tcp --sport 443 -m state --state ESTABLISHED -j ACCEPT
    # ------------------------------------------------------------------------------------------
}

function enable_automatic_updates() {
    # Define the schedule for updates (e.g., daily at 3 AM)
    CRON_SCHEDULE="0 3 * * *"
    
    # Define the update command
    UPDATE_COMMAND="apt-get update && apt-get upgrade -y"
    
    # Add the scheduled task to root's Crontab
    (crontab -l 2>/dev/null; echo "$CRON_SCHEDULE $UPDATE_COMMAND") | crontab -
    # ------------------------------------------------------------------------------------------
    # NOTES:
    # ------------------------------------------------------------------------------------------
    # crontab -l   ->  list the current crontab entrie. I did it only to protect 
    #                  myself from accydentally overwriting or lose existing crontab entries
    # echo         ->  new crontab entry I want to add
    # | crontab -  ->  pipe new entry and tell crontab to read new entry from stdin rether than from a file
    # ------------------------------------------------------------------------------------------
    echo "Scheduled task for updates has been created."
}

function review_unused_user_accounts() {
    # TODO: Check it on test env
    INACTIVE_THRESHOLD=180  # In Days
    INACTIVITY_DATE=$(date -d "$INACTIVE_THRESHOLD days ago" "+%Y%m%d%H%M%S")
    for username in $(cut -d: -f1,7 /etc/passwd | grep -v false | grep -v nologin); do
        # 0. To get only users account I assume that they have shell setup
        #    System accounts usually have in shell part false of nologin text
        #    Any way befor you delete or blocke any account check it manually!

        # 1. Get the users last login information from lastlog
        lastlog_data=$(sudo lastlog -u "$username" | tail -n 1)

        # 2. Check if user logged in to the system at least once
        if echo $lastlog_data | grep -q "Never logged in"; then
            echo "$username - Never Loged In"
        else
            lastlogin_timestamp=$(echo "$lastlog_data" | awk '{print $4, $5, $6, $7, $8}')
            formatted_timestamp=$(date -d "$lastlogin_timestamp" +"%Y%m%d%H%M%S")
            
            if last $username -s $INACTIVITY_DATE | head -n 1 | grep -q -v $username; then
                echo "User: $username, Inactive for $INACTIVE_THRESHOLD days" 
            fi
        fi
    done
}

# function disable_root_login_over_ssh() {
# # TBD
# }

# function disable_password_authentication_over_ssh() {
# # TBD
# }

#================== SSH CONNECTION ====================
# NOTE:
# - Run functions on a remote server using SSH
# - connection_test is a function defined in the script
# - to run function remotely using ssh I have to retrieve 
#   the function definition and then call I can call it to execute remotelly.
#   declare -f some_function allowe me to retrieve function definition.

ssh -i "$ssh_key" "$ssh_user@$remote_server" "$(declare -f connection_test); connection_test"
