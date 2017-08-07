ssh root@host01 "until \$(docker ps -a | grep proxy &> /dev/null); do sleep 1; done; /home/ubuntu/simulate-load.sh"
