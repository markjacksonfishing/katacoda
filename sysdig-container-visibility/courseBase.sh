ssh root@host01 "sed -i s/ollie01/[[KATACODA_HOST]]/g /home/ubuntu/wp.sql"
ssh root@host01 "sed -i s/2886795299/[[HOST_SUBDOMAIN]]/g /home/ubuntu/wp.sql"
ssh root@host01 "curl -L https://raw.githubusercontent.com/katacoda-scenarios/sysdig-scenarios/master/sysdig-container-visibility/assets/simulate-load.sh -o /home/ubuntu/simulate-load.sh && chmod +x /home/ubuntu/simulate-load.sh"
