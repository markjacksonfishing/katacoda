For simplicity, to patch the image we have provided an updated YAML.
Deploy this to overwrite the existing deployment.

`kubectl apply -f manifests/nginx-2.yaml -n web-app`

Once deployed, you can check the status to make sure everything is up and running.

```
$ kubectl get pods -n web-app
NAME                     READY   STATUS    RESTARTS   AGE
nginx-74d54c49c4-b56pz   1/1     Running   0          6s
```
