We have set up a Kubernetes cluster just for you.
On the right you can see the terminal of the `master` node, from which you can interact with the cluster using the `kubectl` tool, which is already configured.

For instance, you can get the details of the cluster by executing  
`kubectl cluster-info`{{execute}}

You can view the nodes in the cluster with the command  
`kubectl get nodes`{{execute}}

You should see 2 nodes: one master and a worker.

Check that you are admin:  
`kubectl auth can-i create node`{{execute}}

In order to follow this course, you will need a [Sysdig](http://sysdig.com/) Monitor account, with Administrator access privileges.

Log in the Sysdig Monitor web UI, go to your profile Settings, and in the `Agent Installation` tab you will find your Access Key (something like `5ca1ab1e-d3ad-beef-dea1-deba7ab1ed0c`).  Keep it handy, as you will need it to authorize the agent against the backend.

![Agent key](/sysdig/courses/monitor/monitor-lab01/assets/image00.png)
