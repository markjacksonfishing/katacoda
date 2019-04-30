We will create three pods (client, mysql, ping) for our workshop:

- The `mysql` pod hosts a database of users and passwords.
- The `ping` pod hosts a form written in PHP, which allows authenticated users to ping a machine.
- We will use the `client` pod to send HTTP requests to `ping`'s web server.

`kubectl create namespace ping
kubectl create -f mysql-deployment.yaml --namespace=ping
kubectl create -f mysql-service.yaml --namespace=ping
kubectl create -f ping-deployment.yaml --namespace=ping
kubectl create -f ping-service.yaml --namespace=ping
kubectl create -f client-deployment.yaml --namespace=ping`{{execute}}

As usual, we make sure the pods are ready:
`kubectl get pods -n ping`{{execute}}

Now we send a request from the `client` pod, asking `ping` to ping localhost.
`kubectl exec client -n ping -- curl -F "s=OK" -F "user=bob" -F "passwd=foobar" -F "ipaddr=localhost" -X POST http://ping/ping.php`{{execute}}

Of course, access should be denied to users without proper credentials:
`kubectl exec client -n ping -- curl -F "s=OK" -F "user=bob" -F "passwd=wrongpassword" -F "ipaddr=localhost" -X POST http://ping/ping.php`{{execute}}
