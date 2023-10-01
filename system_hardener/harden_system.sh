#!/bin/bash

#================== CONFIGURATION ====================
# Define SSH connectio variables

# Put here your remote server IP address
remote_server=10.0.2.15
# Your SSH username
ssh_user=oliwa
# Puy SSH kye path here
ssh_key=/home/oliwa/.ssh/id_rsa.pub

#==================== FUNCTIONS ======================

function connection_test() {
    echo "Test MSG $(date)" >> connection_test.txt
}

#================== SSH CONNECTION ====================
# SSH into the remote server and execute a function
ssh -i "$ssh_key" "$ssh_user@$remote_server" 
