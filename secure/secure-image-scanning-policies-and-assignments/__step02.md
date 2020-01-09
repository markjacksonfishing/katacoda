We’ll now deploy a second application that has a little more variation to it.

From your home directory, run the following:

`kubectl create ns web-app`

`kubectl apply -f manifests/nginx-1.yaml -n web-app`

Once deployed, you can check the status to make sure everything is up and running.

```
kubectl get pods -n web-app
NAME                     READY   STATUS    RESTARTS   AGE
nginx-767988fcc8-zk4xr   1/1     Running   0          6s
```
