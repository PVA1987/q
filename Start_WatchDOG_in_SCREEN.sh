#create screen session
screen -S WDCPU_session -d -m

#wait 2 sec
sleep 2

#run wachdog_CPU
screen -S WDCPU_session -X stuff '/qub/watchdog_CPU.sh\n'

exit 0
