This voting app uses [Kubernetes deployments](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#scaling-a-deployment) to install and manage all the microservices within a [Kubernetes namespace](https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/).

Your home directory contains scripts that wrap around kubectl to create, stress, scale and destroy the application.

In order to deploy the application just execute:

`./create.sh`{execute}

This will take a few moments while the container images are pulled and all the containers are created. You can confirm we have finished when all the pods reach Running state:

`kubectl get pods -n example-voting-app`{execute}

The voting app is now ready: the `example-voting-app` namespace contains the different deployments, which you can explore logging into Sysdig Monitor.
