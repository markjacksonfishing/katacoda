To make the frontend accessible we need to start a service to configure the proxy.

#### Start Proxy

The YAML defines the service as a _NodePort_. NodePort allows you to set well-known ports that are shared across your entire cluster. This is like _-p 80:80_ in Docker.

In this case, we define our web app is running on port 80 but we'll expose the service on _30080_.

`kubectl create -f frontend-service.yaml`{{execute}}

`kubectl get services`{{execute}}

We'll discuss _NodePort_ in future scenarios.
