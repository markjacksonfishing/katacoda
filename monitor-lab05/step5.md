There are several metrics and dashboards that we can use to monitor the application is working as we expect to.

Everything in this application uses HTTP, so we can use the different metrics and default HTTP(s) dashboards offered out-of-the-box in Sysdig Monitor to diagnose and assess performance.

For example, a good place to start would be the HTTP Dashboard (`Default Dashboards` → `Applications` → `HTTP`):

![HTTP](/sysdig/scenarios/monitor-lab05/assets/image05.png)

From this panel, you can quickly check several relevant metrics:

- Request count: will measure the current throughput of your application.
- HTTP Error count: will use the native HTTP response codes to detect any error condition. This metric is a good candidate to set up an alert condition.
- Average request time: it's important to know, not only the number of connections but also the latency of our service, this metric will greatly influence the perception of responsiveness from the point of view of your users.

This fits perfectly well with the four golden signals methodology for monitoring microservices:

- Latency of the HTTP call, both average and worst case
- Traffic as rate of requests per second
- Errors, and their frequency

The golden signals methodology is fitting for this example because it's designed around requests and microservices. As opposed to other methods that focus more strongly on the health signals coming from hardware and software components, golden signals focus on perceived service quality.

Another methodology, more oriented towards resource usage and capacity limits is USE (Utilization, Saturations and Errors)

- CPU, memory, disk I/O, network
- Against host or container limits

The `Overview by container` dashboard will offer you an USE-style overview of your namespace:

![Overview by container](/sysdig/scenarios/monitor-lab05/assets/image06.png)

If you are interested in one step in particular of the data flow, you can also look at the connections table

![Connections table](/sysdig/scenarios/monitor-lab05/assets/image07.png)

From here you can see the different processes inside the pods:

- The curl process that accesses the load balancer service IP, port 80.
- The haproxy process that access the backend service IP, port 8080
- The python backend service that listens in the 8080 port.

And the number of connections, ingress and egress bandwidth of all these communication channels.

In addition to monitoring the application from the HTTP and connectivity perspective, you can also monitor the resources in this namespace as Kubernetes entities.

Sysdig collects the kube-state-metrics out of the box, these metrics will provide full insight regarding the state of your Kubernetes cluster, for example:

- How many instances we are running? How many we want?
- Are the pods running, available and ready?
- Which entities compose my namespace? Are they up and running?

For example using the `Kubernetes State Overview` Dashboard:

![Kubernetes State Overview](/sysdig/scenarios/monitor-lab05/assets/image08.png)

Here, you can see the number of containers, pods, deployments, services, etc. Also if any of your pods is restarting frequently or currently unavailable.
