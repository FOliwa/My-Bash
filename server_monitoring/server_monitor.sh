#!/bin/bash

# ============= Conifguration ================
# Tune it for your needs.

# In seconds:
REFRESHING_INTREVAL=60

CPU_TRESHOLD=10
MEM_TRESHOLD=50
DISK_TRESHOLD=80

# Set to 1 to turn on sending email
# NOTE: Additional configuration needed
SEND_MAIL=0

# ================ Functions =================
function check_cpu_usage() {
    # NOTES:
    # top -b stands for batch mode (defult is interactive)
    #     -n 1 = we get only one batch
    usage=$(top -b -n 1 |grep "%Cpu"| awk '{print $2}'| cut -d, -f1)
    if [ "$usage" -gt "$CPU_TRESHOLD" ]; then
        echo "[ALERT] CPU usage above the treshold!"
    else
        echo 0
    fi
}

function check_memory_usage() {
    usage=$(free -m |grep "Mem" |awk '{print $3/$2 * 100}' | cut -d, -f1)
    if [ "$usage" -gt "$MEM_TRESHOLD" ]; then
        echo "[ALERT] Disk usage above the treshold!"
    else
        echo 0
    fi
}

function check_disk_usage() {
    usage=$(df -h / |awk 'NR==2 {print $5}' | cut -d% -f1)
    if [ "$usage" -gt "$DISK_TRESHOLD" ]; then
        echo "[ALERT] Memory usage above the treshold!"
    else
        echo 0
    fi
}

function prepare_message() {
    cpu_alert=$1
    mem_alert=$2
    disk_alert=$3

    msg="Resource usage on your server has exceeded configured treshold.\n"

    if [ "$cpu_alert" != 0 ]; then
        msg+="$cpu_alert"
        msg+="\n"
    fi

    if [ "$mem_alert" != 0 ]; then
        msg+="$mem_alert"
        msg+="\n"
    fi

    if [ "$disk_alert" != 0 ]; then
        msg+=$disk_alert
        msg+="\n"
    fi
    echo "$msg"
}

function send_mail_notification() {

    # [NOTE] Check email settings!
    #    If you want to send notifications to your for example: Gmail address, 
    #    you'll need to configure your Gmail account accordingly and set up recipients.

    message=$1

    if [ "$SEND_MAIL" -eq "1" ]; then
        recipents=""
        subject="Server Alert"
        echo -e "$message" | mail -s "$subject" "$recipents"
        
    else
        # NOTE: For tests purpouses run script and 
        #       display email content in console
        echo -e "$message"
    fi
}


# ============== Main loop ==============
while true; do
    clear
    
    cpu_alert=$(check_cpu_usage)
    mem_alert=$(check_memory_usage)
    disk_alert=$(check_disk_usage)

    if [ "$cpu_alert" == 0 ] && [ "$mem_alert" == 0 ] && [ "$disk_alert" == 0 ]; then
        echo "All good."
    else
        msg=$(prepare_message "$cpu_alert" "$mem_alert" "$disk_alert")
        send_mail_notification "$msg"
    fi

    sleep $REFRESHING_INTREVAL

done