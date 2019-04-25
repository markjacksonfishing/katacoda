#!/bin/bash

PORT=9090

kubectl create -f jenkins.yaml

while ! kubectl get pods -n jenkins | grep jenkins | grep Running &> /dev/null; do
    echo Waiting until Jenkins is up and running...
    sleep 10
done

POD_NAME=$(kubectl get pods -n jenkins | grep jenkins | awk '{print $1}')
echo -e "Pod Name: $POD_NAME\n"


while ! kubectl exec -n jenkins $POD_NAME cat /var/jenkins_home/secrets/initialAdminPassword &> /dev/null; do
    echo "Loading Admin Token..."
    sleep 5;
done 

ADMIN_PASSWD=$(kubectl exec -n jenkins $POD_NAME -- cat /var/jenkins_home/secrets/initialAdminPassword)
echo "Admin Token: $ADMIN_PASSWD"


cat << EOF

____________________________________________________________________________

Your Jenkins user and password are the following:

    User:     admin
    Password: $ADMIN_PASSWD

Please click on the Jenkins tab above, and use the password above to unlock Jenkins.

Then skip the initial configuration completely (top right X symbol),
and finally press the "Start using Jenkins" button.
____________________________________________________________________________

EOF

