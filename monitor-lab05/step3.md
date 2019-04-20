The ticket generator application emulates a simple consumer/producer (or pub/sub) workflow where N consumers need to communicate with N producers. This communication is mediated and balanced by a proxy.

The server application is a simple python script that produces a unique Ticket ID per requests. The application will start by default with 1 consumer, 1 balancer and 2 servers, but you can easily scale it using the supporting [Kubernetes deployments](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#scaling-a-deployment).

Let's install this consumer/producer example stack in our Kubernetes cluster.

Your home directory contains simple scripts to create and destroy the application. The application is auto-contained in its own Kubernetes namespace.

Just execute:

`./create.sh`{{execute}}

This will create:

- The ticket-generator namespace
- A ticket-server backend deployment composed of ticket-server 2 pods
- A Kubernetes service to communicate with the backend service abstraction
- A ticket-balancer deployment composed of 1 haproxy pod
- A Kubernetes service to communicate with the load balancer service abstraction
- A ticket-client deployment composed of 1 “ticket-consumer” pod

Wait until all the pods reach Running state:

`kubectl get pods -n ticket-generator`{{execute}}
