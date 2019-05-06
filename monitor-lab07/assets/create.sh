#!/bin/bash

PORT=9090

kubectl create -f jenkins.yaml

while ! kubectl get pods -n jenkins | grep jenkins | grep Running &> /dev/null; do
    echo Waiting until Jenkins is up and running...
    sleep 10
done

cat << EOF
____________________________________________________________________________

Jenkins is ready!

Please click on the Jenkins tab above to access its web interface.
____________________________________________________________________________

EOF
