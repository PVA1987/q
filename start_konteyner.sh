#!/bin/bash

# start konteyner
docker start qub

#wait after start docker+hasrateCPU
sleep 60 

#create screen session
screen -S WDCPU_session -d -m

#wait 2 sec
sleep 2

#run wachdog_CPU
screen -S WDCPU_session -X stuff '/qub/watchdog_CPU.sh\n'

exit 0
