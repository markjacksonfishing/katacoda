There are several metrics and dashboards that we can use to monitor the application is working as we expect to.

Everything in this application uses HTTP, so we can use the different metrics and default HTTP(s) dashboards offered out-of-the-box in Sysdig Monitor to diagnose and assess performance.

For example, a good place to start would be the HTTP dashboard (`Default Dashboards` → `Applications` → `HTTP`):

![HTTP dashboard](/sysdig/courses/monitor/monitor-lab02/assets/image05.png)

From this panel, you can quickly check several relevant metrics:

- Request count (per second): measures the current throughput of your service, how many connections are being serviced.
- HTTP error count (per second): looks at the [HTTP response codes](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes) to detect any error condition. Remember that 4XX response codes are client errors and 5XX are server errors.
- Average request time (in milliseconds): measures the latency of your service. This can give you an idea of the perceived quality of service from the client point of view.

These metrics are what is called golden signals in the [Google SRE Book](https://landing.google.com/sre/sre-book/chapters/monitoring-distributed-systems/). Using these we can monitor any application from a user's perspective, and should be the first metrics to look at to determine the health and performance of any application. This is specially relevant on microservices applications where the different components communicate with each other using some kind of requests (HTTP, gRPC, etc).

Here we can also see how Sysdig is able to identify and decode certains application protocols (HTTP in this case) and give you APM like metrics like which are the top requested URLs or endpoints, the slowest ones, HTTP response codes or request types (GET, POST, etc).

Other monitoring methodologies look at the resource consumption instead. For example USE monitoring tries to abstract service capacity on resource utilization, saturation and errors. Utilization metrics could be CPU % usage, memory usage, etc, saturation metrics could be memory pages faults or disk IO wait, and errors could be failed attempts to open files to mention one example.

Apart from HTTP, we already know that this application is also using SQL (PostgreSQL in particular). Sysdig can also gather generic SQL metrics, or specific MySQL and PostgreSQL metrics, out of the box without instrumenting the SQL-serving containers!

Let's take a look at the `MySQL/PostgreSQL` dashboard:

![MySQL/PostgreSQL dashboard](/sysdig/courses/monitor/monitor-lab02/assets/image06.png)

You will quickly identify the service golden metrics again, database-oriented this time.

- Number of requests per second
- Number of errors per second
- Average and maximum request time

You can also see relevant database information like:

- Top tables by number of requests
- Slowest queries
- Most frequent queries

Proposed exercises
------------------

Using default dashboards, try to find out:

- Which is the _read vs write_ ratio in your database? (how many read operations per write operation)
- Would you be able to show the number of SQL requests per pod.name?
- What is the worst and best SQL latency that you have experienced since you deployed the application?
