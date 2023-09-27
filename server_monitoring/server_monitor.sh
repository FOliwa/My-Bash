#!/bin/bash

# Check CPU usage
function get_cpu_usage() {
    # NOTES:
    # top -b stands for batch mode (defult is interactive)
    #     -n 1 = we get only one batch
    echo $(top -b -n 1 |grep "%CPU:"| awk '{print $2}'| cut -d. -f1)

}

function get_memory_usage() {
    echo $(free -m |grep "Mem" |awk '{print $3/$2 * 100}')
}


function get_disk_usage() {
    echo $(df -h / |awk 'NR==2 {print $5}' | cut -d% -f1)
}

# 
data_refreshing_time=5

cpu_treshold=10
mem_treshold=
disk_treshold=80


# Infinite loop
while true; do
    clear
    
    cpu_usage=$(get_cpu_usage)
    mem_usage=$(get_memory_usage)
    disk_usage=$(get_disk_usage)
   
    echo "==================================="
    echo " CPU Usage: $cpu_usage"
    echo " Memory Usage: $mem_usage"
    echo " Disk Usage: $disk_usage"
    echo "==================================="

    sleep $data_refreshing_time

done