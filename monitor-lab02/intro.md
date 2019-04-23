In this scenario we will deploy an example microservice voting app in Kubernetes that issues votes for your favourite: dogs or cats. Results are stored in a database and then a report can be generated with the results.

Suddenly there are more people voting using our application and the app becomes slower and slower. In this lab we will find the microservices bottleneck and check how we can scale this application to handle the required load.

Goals
-----

- Explore a microservices application using Sysdig Monitor:
  - How many nodes and containers I have on my cluster?
  - Where is each container running?
  - How this microservices application works?
  - Which services talk to each other?
  - What's running inside each container and microservice?
- Monitor a web services application. Key metrics and monitoring approaches: Golden signals, USE resource monitoring and SQL connectivity and performance.
- **Diagnose a failed application update**, set the alerts, notification channels and captures to react immediately and be able to find the root cause if this situation arises in any of your Kubernetes namespaces.
- Use Sysdig captures and Sysdig Inspect to deep dive into the system calls and perform troubleshooting using syscall tracing. In this lab we will be able to detect a surge in SQL errors and diagnose the precise PostgreSQL client and query that have been modified in the new version of the app and is causing the problem.

Competencies required
---------------------

The student needs to understand the basic concepts of microservices applications, containers and Kubernetes. He will be able to check the status of deployed Kubernetes resources (pods, deployments, services) and nodes.