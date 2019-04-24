There are several metrics and dashboards that we can use to observe whether the application is working as we expect.

Everything in this application uses HTTP, so we can use the different metrics and default HTTP(s) dashboards offered out-of-the-box in Sysdig Monitor to diagnose and assess performance.

For example, a good place to start would be the HTTP dashboard (`Default Dashboards` → `Applications` → `HTTP`):

![HTTP dashboard](assets/image04.png)

From this panel, you can quickly check several relevant metrics:

- Request count (per second): measures the current throughput of your service and how many connections are being serviced.
- HTTP error count (per second): looks at the [HTTP response codes](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes) to detect any error condition. Remember that 4XX response codes are client errors and 5XX are server errors.
- Average request time (in milliseconds): measures the latency of your service. This can give you an idea of the perceived quality of service from the client point of view.

These metrics are what is called golden signals in the [Google SRE Book](https://landing.google.com/sre/sre-book/chapters/monitoring-distributed-systems/). Using these we can monitor any application from a user's perspective, and should be the first metrics to look at to determine the health and performance of any application. This is specifically relevant on microservices applications where the different components communicate with each other using some kind of requests (HTTP, gRPC, etc).

Here we can also see how Sysdig is able to identify and decode certains application protocols (HTTP in this case) and give you APM-like metrics like, which are the top requested URLs or endpoints, which are the  slowest, and HTTP response codes or request types (GET, POST, etc).

Other monitoring methodologies look at the resource consumption instead. For example USE monitoring tries to abstract service capacity on resource utilization, saturation and errors. Utilization metrics could be CPU % usage, memory usage, etc, saturation metrics could be memory pages faults or disk IO wait, and errors could be failed attempts to open files, to mention one example.

The dashboard `Kubernetes` → `Resource Usage` → `Kubernetes Deployment Health` will offer you an USE-style overview that aggregates metrics by Kubernetes metadata:

![Deployment health dashboard](assets/image05.png)

Sysdig can also monitor the orchestration state. This is important to help you know whether Kubernetes is deploying and orchestrating things as we expect. These metrics are also known as kube-state-metrics. The dashboard `Kubernetes` → `Kubernetes State` → `Kubernetes Deployment State` will give you some insights. Different dashboards that report on different resources will need to be used depending on the scope we are looking at. For a cluster scope we can look at namespaces; inside a namespace we can look at deployments, inside a deployment we can look at pods.

Proposed exercises
------------------

Using kube-state dashboards, try to find out:

- Is any Kubernetes pod restarting?
- How many instances (pods) do we have for each service? And how many do we expect?
- Pods desired (defined) are equal to pod available?
