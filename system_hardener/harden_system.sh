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

    # Determine Your Requirements - check services and ports using by them
    HTTP_PORT = 80      # HTTP
    HTTPS_PORT = 443    # HTTPS
    SSH_PORT = 22       # SSH

    # Set a default policy for incoming and outgoing traffic.
    # - default policy for incoming traffic = "DROP"
    # - default policy for outgoing traffic = "ALLOW"

    # Allow Necessary Services by allowing incoming traffic only on ports required for your services
    # If you need SSH access, allow SSH (port 22) traffic, but consider restricting it to specific IP addresses or using SSH keys for authentication.

    # TBD
}

# function check_updates() {
# # TBD
# }

# function review_unused_user_accounts() {
# # TBD
# }

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
