Logging into Sysdig Monitor, you should arrive at the Explore tab by default, the explore tab offers you an inventory overview where you can group the different entities using physical attributes - like host id - or logical attributes like pods, inside deployments, inside Kubernetes namespaces.

Once we have selected the desired grouping, you can monitor a single metric or a complete Dashboard.

For example, change the grouping view to _Deployments and Pods_

![Grouping](/sysdig/scenarios/monitor-lab05/assets/image01.png)

You should be able to see the ticket-generator namespace and the 3 deployments and 4 pods that make it up:

![Deployments](/sysdig/scenarios/monitor-lab05/assets/image02.png)

The normal traffic flow of the application should be:

`Ticket client` → `Load Balancer service` → `Load Balancer Pod` → `Backend service` → `Backend pods`

You should be able to see exactly this, selecting the ticket-generator namespace and the `Topology` → `Network Traffic` Default dashboard.

![Network traffic](/sysdig/scenarios/monitor-lab05/assets/image03.png)

As you can see, is the typical layered application. A 'ticket' client requests a new ticket to the load balancer frontend, and this balancer forwards the requests to the two backend server pods. All these pods communicate using HTTP REST-style requests.

Proposed exercises
------------------

You can explore several aspects of your application or cluster directly from the explore tab and using default Dashboards, for example, which processes are running in each container:

![Processes](/sysdig/scenarios/monitor-lab05/assets/image04.png)

From this interface, try to explore:

- In which physical node is running each pod of our stack.
- CPU, memory, bandwidth consumption of each pod, a deployment and the namespace.
- Kube state metrics health.
