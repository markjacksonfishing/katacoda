The second part is a service. A Kubernetes service is a named load balancer that proxies traffic to one or more containers. The proxy works even if the containers are on different nodes.

Services proxy communicate within the cluster and rarely expose ports to an outside interface.

When you launch a service it looks like you cannot connect using curl or netcat unless you start it as part of Kubernetes. The recommended approach is to have a LoadBalancer service to handle external communications.

#### Create Service

The YAML defines the name of the replication controller, _redis-master_, and the ports which should be proxied.

`kubectl create -f redis-master-service.yaml`{{execute}}

#### List &amp; Describe Services

`kubectl get services`{{execute}}

`kubectl describe services redis-master`{{execute}}
