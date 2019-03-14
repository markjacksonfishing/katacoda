#!/bin/bash
mkdir -p /root/tutorial && cd /root/tutorial && git clone https://github.com/katacoda/kubernetes-guestbook.git .

echo 'kubectl create -f redis-master-controller.yaml' >> ~/start.sh
echo 'kubectl create -f redis-master-service.yaml' >> ~/start.sh
echo 'kubectl create -f redis-slave-controller.yaml' >> ~/start.sh
echo 'kubectl create -f redis-slave-service.yaml' >> ~/start.sh
echo 'kubectl create -f frontend-controller.yaml' >> ~/start.sh
echo 'kubectl create -f frontend-service.yaml' >> ~/start.sh
chmod +x ~/start.sh

mv ~/start.sh /usr/bin/start.sh
