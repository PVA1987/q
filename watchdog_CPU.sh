#!/bin/bash

# Set the maximum number of attempts
max_attempts=35
attempts=0

# Infinite loop to continuously monitor CPU load
while true; do
    # Get the current CPU load percentage
    cpu_load=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | awk -F. '{print $1}')

    echo "Current CPU load: $cpu_load%"

    # Check if the CPU load is less than 30%
    if [ "$cpu_load" -lt 40 ]; then
        # Increment the attempt counter
        ((attempts++))

        # Print a message to the console
        echo "Attempt $attempts: CPU load below 30%, waiting for recovery..."

        # If maximum attempts reached, initiate reboot
        if [ "$attempts" -eq "$max_attempts" ]; then
            echo "Maximum attempts reached, initiating reboot..."
            # Wait for some time before initiating the reboot (e.g., 10 seconds)
            sleep 10
            # Reboot the computer using sudo privileges
            reboot
            #exit 0
        fi
    else
        # Reset the attempt counter if CPU load is normal
        attempts=0
    fi

    # Wait for some time before the next check (e.g., 10 seconds)
    sleep 10
done
