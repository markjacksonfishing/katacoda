One of the key advantages of using containers and Kubernetes is that you can upgrade your services **fast** and persistent state is clearly separated from software.

Rolling updates and balancers allow you to update a service live without losing uptime, or even without adding noticeable latencies if you have deployed enough redundancy.

Your pods will be updated often and Kubernetes may decide to destroy and recreate a pod to optimize cluster resources.

Bottom line is: expect your pods to be terminated at any time and be prepared to detect problematic updates.

But, how to correlate changes in the deployment definition with a problem in our golden metrics? **Sysdig Monitor is tightly integrated with Kubernetes events and kube-state-metrics**.

You can directly observe the stream of Kubernetes & Docker events from the `Events` left panel tab:

![Events](/sysdig/scenarios/monitor-lab02/assets/image07.png)

Or, even more handy to diagnose a problematic upgrade, you can also see these event superimposed over any other Sysdig metric in a panel:

![Superimposed event](/sysdig/scenarios/monitor-lab02/assets/image08.png)

In the picture above you can clearly see the rectangular superimposed event snippets, and how are they clearly related with a brief service interruption `net.http.request.count = 0`. You can gather more event information or jump to the events interface for that specific event using the pop-up box that you can see hovering your mouse over the rectangle.

As the cluster operator you get a notification: a service version update is scheduled for today.

Let's simulate that update now, running in your home directory:

`./update.sh`{{execute}}

You can check that the old `result` pods were terminated, and new updated pods were created:

`kubectl get pods -n lab2-example-voting-app`{{execute}}

They are in `Running` state, so the pod initialization process seems fine so far.

If you take a look at the last Kubernetes events, you can see how the pods have been killed and replaced:

![Kubernetes events](/sysdig/scenarios/monitor-lab02/assets/image09.png)

You can gather more information from the kube-state-metrics. Sysdig collects the kube-state-metrics out of the box, these metrics will provide full insight regarding the state of your Kubernetes cluster, for example:

- How many instances we are running? How many we want?
- Are the pods running, available and ready?
- Which entities compose my namespace? Are they up and running?

Let's take a look at the `Kubernetes Namespace State` default dashboard:

![Kubernetes namespace state](/sysdig/scenarios/monitor-lab02/assets/image10.png)

There are no restarting, unavailable or paused containers and the total number of pods and deployments is the expected one. From the Kubernetes orchestrator point of view, we don't see any problems arising from the latest service update.

Now, let's take a look at the application layer using the golden service metrics. Our application uses basically two protocols: HTTP and SQL. You can start taking a look at the HTTP default dashboard:

![Kubernetes namespace state](/sysdig/scenarios/monitor-lab02/assets/image11.png)

Notice the yellow rectangles indicating the Kubernetes event on top of the metrics. The HTTP error count is very low and the other HTTP metrics do not seem to have suffered any significant change related with the update.

Now, let's look at the SQL side of our application:

![SQL dashboard](/sysdig/scenarios/monitor-lab02/assets/image12.png)

There is a significant bump in the number of SQL errors that clearly started when we updated the service pods (**yellow rectangle events**). There is something wrong with this new version.

Proposed exercises
------------------

- Can you locate which pods in particular are returning the sql errors?
- What could be the cause of the sudden drop in SQL average latency times?
- Take a look at the last screenshot for the `MySQL/PostgreSQL` default dashboard, do you see any other suspicious difference?
