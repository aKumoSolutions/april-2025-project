#!/bin/bash

apache=$(systemctl status httpd | head -n 3 | tail -n 1 | awk -F " " '{ print $2 }' )

if [ $apache = "active" ]; then
    echo "Service is running perfectly"

else
    echo "There is problem, go and fix it"

fi

