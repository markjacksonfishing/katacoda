So far, we have deployed the first layer of our microservices architecture (the backend servers). Logging into Sysdig Monitor you should be able to see the `nginx-flask` namespace and the 2 deployments and 3 pods that make it up.

Now, let's try to deploy the frontend nginx services that will balance the traffic to the backends:

`kubectl scale deployment nginx -n nginx-flask --replicas=2`{{execute}}

You will notice that the nginx pods don't show up in the Sysdig Monitor web interface, while the nginx namespace appears and disappears intermittently. What is happening?

`kubectl get pods -n nginx-flask`{{execute}}

Our `nginx` pods are in `CrashLoopBackOff` state!
