#!/bin/bash
LOG_FILE="/var/log/droplethealth.log"

{
echo "====================="
echo "$(date +'%Y-%m-%d %H:%M:%S') Starting to Check Droplet Status."

status=$(curl -s https://status.digitalocean.com/api/v2/status.json | jq  .status)
echo "$(date +'%Y-%m-%d %H:%M:%S') $status"

indicator_status=$(curl -s https://status.digitalocean.com/api/v2/status.json | jq -r .status.indicator)
if [[ $indicator_status != "none" ]]; then
    echo "$(date +'%Y-%m-%d %H:%M:%S') Droplets are in danger"
else
    echo "$(date +'%Y-%m-%d %H:%M:%S') Droplets are healthy"
fi
echo "======================="
} >> $LOG_FILE