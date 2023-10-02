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

#================== SSH CONNECTION ====================
# NOTE:
# - Run functions on a remote server using SSH
# - connection_test is a function defined in the script
# - to run function remotely using ssh I have to retrieve 
#   the function definition and then call I can call it to execute remotelly.
#   declare -f some_function allowe me to retrieve function definition.

ssh -i "$ssh_key" "$ssh_user@$remote_server" "$(declare -f connection_test); connection_test"
