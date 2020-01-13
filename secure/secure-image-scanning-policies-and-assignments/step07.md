You may also wish to scan images currently running in an environment.

Let's launch a deployment consisting of `nginx` containers. From your home directory, run the following:

```
kubectl create ns web-app
kubectl apply -f manifests/nginx-1.yaml -n web-app
```

Once deployed, you can check the status to make sure everything is up and running.

```
kubectl get pods -n web-app
NAME                     READY   STATUS    RESTARTS   AGE
nginx-767988fcc8-zk4xr   1/1     Running   0          6s
```

Now browse to `Image Scanning` > `Runtime`, and in the 'Browse By' dropdown, select *Kubernetes (Deployments)*

![Runtime Scan](secure-image-scanning-policies-and-assignments/assets/RuntimeScan02.png)

You can highlight the scope you'd like to see the scan status of.  For example, if you select `web-app` you will see only details of image scans of containers in that specific deployment.

![Runtime Scan](secure-image-scanning-policies-and-assignments/assets/RuntimeScan03.png)

<<ToDo - redo 'RuntimeScan03.png' - I'd scanned nginx:1.15.0 & 1.16.0 within the last hour, but students wont have.

Click on the unscanned *nginx:1.15.0* container, and then click 'Scan Now'

![Scan Now](secure-image-scanning-policies-and-assignments/assets/RuntimeScan04.png)

Once complete you can click the container name to see the scan results.
