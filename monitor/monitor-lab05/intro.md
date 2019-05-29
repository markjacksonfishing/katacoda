In this scenario we will deploy a ticket token generator example microservices app in Kubernetes.

The app has 3 services and 4 containers: client, balancer and servers (2):

- The client periodically request a new ticket token.
- The load balancer distributes HTTP requests through servers using HAproxy.
- The servers run a simple example Python application that generate a unique ticket token per request.

But there is an issue with this app: it works well on the developer's laptop using Docker, but the same image triggers some 502 HTTP errors when deployed on the Kubernetes production environment.

Goals
-----

- Explore a microservices application using Sysdig Monitor:
  - How many nodes and containers I have on my cluster?
  - Where is each container running?
  - How this microservices application works?
  - Which services talk to each other?
  - What's running inside each container and microservice?
- Monitor a web services application. Key metrics and monitoring approaches: Golden signals, USE resource monitoring and Kubernetes orchestration.
- Identify failure points and create the alerts to detect any of these error conditions.
- Use Sysdig captures and Sysdig Inspect to deep dive into the system calls and perform troubleshooting using syscall tracing. In this lab we will be able to follow the HTTP conversation and pinpoint the exact location of the glitch that is causing the 502 HTTP errors.

Competencies required
---------------------

The student needs to understand the basic concepts of microservices applications, containers and Kubernetes. You will be able to check the status of deployed resources (pods, deployments, services) and nodes.
