The example voting application will normally behave well in standard conditions, as deployed. But imagine that suddenly our app starts to receive more traffic.

- How can we monitor the application under this situation?
- What can we do to find out the bottleneck in the application?
- If we make some changes, can we confirm the application is providing service properly under the current workload?

For training purposes we can stress the application manually by executing the following script within the home directory:

`./stress.sh`{{execute}}

This will scale up the instances of `voter` service, generating more load on the application.

After a few moments, you will be able to see a change in the golden signals behavior, for example in the `Services` → `Kubernetes Service Golden Signals` dashboard.

![Kubernetes Service Golden Signals dashboard](assets/image06.png)

Proposed exercises
------------------

- Can you configure events to show on top of the metrics?
- How many instances of the voter service do we have now?
- How many requests are we receiving now (total)?
- What's the application response time?
- Is the application triggering any errors?

We can see clearly how the Response Time per Service increases when our application becomes stressed. We also see that Request Rate per Service increases and see at the same time that our application starts to gets some errors. From these metrics we can conclude that under stress our application is degraded.

Golden signals confirm the application is misbehaving. Now let's look at resource usage to find out if we are hitting any limits.

Proposed exercises
------------------

- Can you diagnose if everything is still healthy from the Kubernetes point of view?
- Can we identify any change in resource usage?
- Is this change impacting our target latencies?
- What are the possible options to address this scenario?

Looking at the `Services` → `Kubernetes Service Golden Signals` dashboard, we can see an increase of CPU usage on the voter service:

![Kubernetes Service Golden Signals dashboard](assets/image07.png)

And if we dig a little deeper using the `Hosts & Containers` → `Container Limits` dashboard, we can see that the CPU of the `voter` service is hitting its limit:

![Container limits](assets/image08.png)

The `cpu.quota.used.percent` is a metric which indicates percentage of CPU quota a container actually used over a defined period of time. This is a hard limit for the amount of CPU the container can use, and for this reason, the CPU quota should not exceed 100%. From our dashboard we can see that the `vote` service is hitting its 100% limit so that this indicates that the `vote` service is the bottleneck.
