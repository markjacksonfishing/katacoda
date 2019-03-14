With the data services started we can now deploy the web application. The pattern of deploying a web application is the same as the pods we've deployed before.

#### Launch Frontend

The YAML defines a service called frontend that uses the image _gcr.io/google_samples/gb-frontend:v3_. The replication controller will ensure that three pods will always exist.

`kubectl create -f frontend-controller.yaml`{{execute}}

#### List controllers and pods

`kubectl get rc`{{execute}}

`kubectl get pods`{{execute}}

#### PHP Code

The PHP code uses HTTP and JSON to communicate with Redis. When setting a value requests go to _redis-master_ while read data comes from the _redis-slave_ nodes.
