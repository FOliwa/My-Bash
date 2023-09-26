#!/bin/bash

# Check CPU usage
function get_cpu_usage() {
    # NOTES:
    # top -b stands for batch mode (defult is interactive)
    #     -n 1 = we get only one batch
    echo $(top -b -n 1 |grep "%CPU:"|awk '{print $2}'|cut -d. -f1)

}

function get_memory_usage() {
    echo $(free -m |grep "Mem" |awk '{print $3/$2 * 100}')
}


function get_disk_usage() {
    echo $(df -h / |awk 'NR==2 {print $5}' | cut -d% -f1)
}

get_cpu_usage
get_memory_usage
get_disk_usage