#!/bin/bash

# Starts Automatic1111 based on Google Chrome state:
# - if it is opened, Automatic1111 starts
# - if it is closed, Automatic1111 is killed

# script to be executed
SCRIPT_PATH=$HOME/sd-training-base-scripts/run_automatic1111.sh

# initially chrome is not running
chrome_running=false

# initially your script is not running
script_pid=0

while true
do
    if pgrep -af "chrome.*type=renderer" | grep -v "pgrep" > /dev/null; then
        echo "Google Chrome is running."

        # if chrome is running and your script is not running, start your script
        if ! $chrome_running && ! pgrep -f $SCRIPT_PATH > /dev/null; then
            echo "Starting your script."
            sh $SCRIPT_PATH &
            script_pid=$!
            chrome_running=true
        fi
    else
        echo "Google Chrome is not running."

        # if chrome is not running and your script is running, stop your script
        if $chrome_running; then
            echo "Stopping your script."
            kill -INT $script_pid
            chrome_running=false
        fi
    fi

    # check every second
    sleep 1
done
