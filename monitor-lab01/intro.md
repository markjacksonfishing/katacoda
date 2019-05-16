In this scenario we will deploy an example microservice voting app in Kubernetes that issues votes for your favourite: dogs or cats. Results are stored in a database and then a report can be generated with the results.

Suddenly there is more people voting using our application and the app becomes slower and slower. In this lab we will find the microservices bottleneck and check how we can scale this application to handle the required load.

Competencies required
---------------------

The student needs to understand the basic concepts of microservices applications, containers and Kubernetes, and be able to check the status of deployed Kubernetes resources (pods, deployments, services) and nodes.

Goals
-----

- Explore a microservices application using Sysdig Monitor:
  - Where is each container running?
  - How does this microservices application work?
  - Which services talk to each other?
  - What's running inside each container and microservice?
- Monitor a web services application. Key metrics and monitoring approaches: Golden signals, Utilization Saturation and Errors (USE) resource monitoring and Kubernetes orchestration.
- Identify performance bottlenecks in the application.
- Scale the application to handle the required load while monitoring the changes.
- Tailor Sysdig to provide application assurance for this microservices application
  - Custom dashboards
  - Useful alerts on health metrics
