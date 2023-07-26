#!/bin/bash

# Starts Automatic1111 based on Google Chrome state:
# - if it is opened, Automatic1111 starts
# - if it is closed, Automatic1111 is killed

# script to be executed
script_path="/path/to/your/script.sh"

# initially chrome is not running
chrome_running=false

# initially your script is not running
script_pid=0

while true
do
    # Checking for the main Google Chrome process
    if pgrep -af "chrome.*type=renderer" | grep -v "pgrep" > /dev/null; then
        echo "Google Chrome is running."

        # if chrome is running and your script is not running, start your script
        if ! $chrome_running && ! pgrep -f $script_path > /dev/null; then
            echo "Starting your script."
            sh $script_path &
            script_pid=$!
            chrome_running=true
        fi
    else
        echo "Google Chrome is not running."

        # if chrome is not running and your script is running, stop your script
        if $chrome_running; then
            echo "Stopping your script."
            kill -TERM $script_pid
            sleep 2
            if kill -0 $script_pid 2> /dev/null; then
                echo "Script did not stop with SIGTERM. Sending SIGKILL."
                kill -KILL $script_pid
            fi
            chrome_running=false
        fi
    fi

    # check every second
    sleep 1
done
