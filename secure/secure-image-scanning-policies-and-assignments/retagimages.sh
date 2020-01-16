#!/bin/bash

echo "Please enter your repository name (i.e. 'yourrepo') :"

read REPONAME
echo "REPONAME=$REPONAME" > ./.reponame

docker tag learnsysdig/node:10.8.0 $REPONAME/node:10.8.0
docker tag learnsysdig/nginx:1.10.0 $REPONAME/nginx:1.10.0
docker tag learnsysdig/nginx:1.15.0 $REPONAME/nginx:1.15.0
docker tag learnsysdig/nginx:1.16.0 $REPONAME/nginx:1.16.0
docker tag learnsysdig/nginx:1.17.0 $REPONAME/nginx:1.17.0
docker tag learnsysdig/dummy-vuln-app $REPONAME/dummy-vuln-app


echo "Images retagged"
echo ""
docker images | grep $REPONAME
