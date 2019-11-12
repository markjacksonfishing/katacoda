# The Attack

Let's simulate an attack on our cluster.  In this example we will use `kubectl exec` to download a `tar` file, explode it and run some other nefarious commands.

First let's create a deployment.

```
$ kubectl create ns voting-app
$ kubectl apply -f lab1/manifests/ -n voting-app
$ kubectl get pods -n voting-app

```
