Now, let's test an scenario in which we can appreciate the power of the simulation functionality. 

Suppose that your team generated the same PSP definition we automatically generated in last step. But, your deployment now needs higher permissions (for example, running as privileged).

This is the new deployment.yaml:

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  namespace: default
  labels:
    app: nginx
spec:
  replicas: 1
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.7.9
        ports:
        - containerPort: 80
        securityContext:
          privileged: true
```{{copy}}

We are going to apply this deployment into production with:

1. create the deployment.yaml tab:

`vi deploymentV2.yaml`{{execute}}

2. and apply it to your deployment with: 

`kubectl apply -f deploymentV2.yaml`{{execute}}

As PSP is not activated yet at our cluster, our deployment will be created smoothly and without complaints (remember that we are still simulating PSP effects on our cluster!). But, here comes the key, the simulation at Sysdig will output an event letting us now that this deployment is conflicting with our defined PSP. 

![Event](/sysdig/courses/secure/secure-pod-policy-advisor/assets/image2.png)

In a real production environment, this would have been problems for us (services not working, pods not being created, etc.) but here we have taken a step ahead preventing this to happen. 

With this information, we'll be able to edit our deployment (or maybe the PSP) in order to make them work together. Or, as we show in the previous step, we can just generate the optimal PSP definition for our cluster.