Logging into Sysdig Monitor, you should arrive at the Explore tab.  This view offers an inventory overview where you can group the different resources or entities in your infrastructure.

By default, Sysdig Monitor will show you live data with a one hour time window.  For this workshop it is recommended to use the time window navigation bar (in the bottom of the screen) to select a shorter time window, such as 10 seconds.

_Groupings_ are hierarchical organizations of labels, allowing users to organize their infrastructure views on the Explore tab in a logical hierarchy. This results in a tree view, with rows for each infrastructure object applicable to each level.  For each entity we can see some basic metrics in the table like CPU, memory, network or I/O.

You can view the data using physical attributes like hostname and containers, or logical attributes like Kubernetes namespaces, deployments and pods.

For example, change the grouping view to _Deployments and Pods_

![Grouping](/sysdig/scenarios/monitor-lab02/assets/image02.png)

You should be able to see the `lab2-example-voting-app` namespace with all the deployments and pods that make it up:

![Deployments](/sysdig/scenarios/monitor-lab02/assets/image03.png)

Proposed exercises
------------------

Let's try to answer some questions before we go any further:

- How many nodes do you have in your cluster?
- Can you see the Sysdig agent is running on each node?
- Can you tell how many instances do you run of each microservice in the voting app?
- Can you tell on which node is currently running each voting app microservice?
- Which microservice uses more CPU? And I/O?
- Which node has more memory usage? And disk usage?

Now we have an idea of the components of the app. But how these microservices interact with each other? In order to emit a vote we should probably expect traffic between the voter and the vote service. The result server will then check the database to generate the results.

With Sysdig Monitor you can use _Topology maps_ to visualize how entities interact with each other. When using a physical grouping we can see the different entities talking with each other, but with a logical grouping we get a better understanding of how the Kubernetes-orchestrated services interact.

Select a grouping like `Deployments and pods`: Namespaces &gt; Deployments &gt; Pods &gt; Containers. After selecting `Entire Infraestructure` in the tree, you will be able to choose one of the default dashboards: `Topology` → `Network Traffic`.

If instead of our entire infrastructure we want to look only into a specific part, we will change from `Entire Infrastructure` into, for instance, `lab2-example-voting-app` namespace. We call this _changing the scope_.

![Network traffic](/sysdig/scenarios/monitor-lab02/assets/image04.png)

As we drill into these entities, we can see how we can even look inside the container, down to the process level. This is a really cool example of the deep visibility that Sysdig provides.

You can monitor several aspects of your application or cluster directly from Explore using the default Dashboards. There are a bunch of them available for Applications, Hosts & Containers, Kubernetes, Network, Services and Topology as we have just seen.

Proposed exercises
------------------

Using default dashboards, try to find out:

- Which technology is used for each voting app microservice? (identify each process running inside each container)
- What are the network connections of the worker deployment?
- Do we have any container CPU or memory limits on the containers?
