This voting app uses [Kubernetes deployments](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#scaling-a-deployment) to install and manage all the microservices within a [Kubernetes namespace](https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/).

Your home directory contains scripts that wrap around kubectl to create, stress, and scale the application.  This scenario is very similar to lab1, but with a different error condition and purpose.

In order to deploy the application just execute:

`./create.sh`{{execute}}

This will take a few moments while the container images are pulled and all the containers are created. You can confirm we have finished when all the pods reach `Running` state:

`kubectl get pods -n lab2-example-voting-app`{{execute}}

The voting app is now ready: the `lab2-voting-app` namespace contains the different deployments:

- The `voter` is an HTTP client which issues the votes randomly. Sometimes it votes for dogs and sometimes for cats.
- The `vote` is an HTTP server that collects the votes and stores in a fast in-memory database.
- The `worker` synchronizes data between two databases. One stores data in memory and the other offers disk persistence.
- The `result` is an HTTP server that reports on the results.
- The `observer` is an HTTP client that retrieves the results.
- The `db` is a database that persists the votes collected by `vote`.
