ssh root@host01 "for i in {1..20}; do /home/ubuntu/simulate-load.sh && break || sleep 1; done"
