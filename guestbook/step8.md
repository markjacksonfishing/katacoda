With all controllers and services defined Kubernetes will start launching them as Pods. A pod can have different states depending on what's happening. For example, if the Docker Image is still being downloaded then the Pod will have a _pending_ state as it's not able to launch. Once ready the status will change to _running_.

#### View Pods Status

You can view the status using the following command:

`kubectl get pods`{{execute}}

#### Find NodePort

If you didn't assign a well-known NodePort then Kubernetes will assign an available port randomly. You can find the assigned NodePort using _kubectl_.

`kubectl describe service frontend | grep NodePort`{{execute}}

#### View UI

Once the Pod is in running state you will be able to view the UI via port 30080. Use the URL to view the page  https://[[HOST_SUBDOMAIN]]-30080-[[KATACODA_HOST]].environments.katacoda.com

Under the covers the PHP service is discovering the Redis instances via DNS. You now have a working multi-tier application deployed on Kubernetes.
