# The Forensics

Let's now play the sysadmin role, and investigate the incident.  Open the Sysdig Secure window on the right pane, and click on *Activity Audit* on the left menu.

The area on the left of the screen defines the scope. You can define here how you'd like to view your environment, for example physically by hosts and containers, or logically by deployments and pods. For now, select *'Deployments and Pods'*

The second area to note is the time graph of activity.  This gives you a visual representation of activity on the system. The 'Filters' and 'Datasources' boxes allow you to restrict the content in view. There are 3 datasources available

 - `cmd` - View commands execututed directly on the container
 - `net` - View network activity
 - `kube exec` - View commands executed against the Kubernetes API

Below the graph you see the actual commands that were initiated, categorized as `cmd`, `net` or `kube exec` as outlined above.  You will see here that someone spawned a **terminal shell in a container.**  

*!!NEED TO FINALSE THESE STEPS ONCE IN PRODUCTION!!*

Clicking on a specific command we can see more details on the command itself.  Click on !!TBS - a 'cmd' entry.  On the right pane you will now see more information on the executed command, namely

 - the 'time' the event occured
 - the 'full command line' details
 - the 'working directory' the command was executed from
 - the Kubernetes 'scope' that was (namespace, deployment, pod)
 - the physical 'host' on which it occurred
 - 'additional details', including the `uid`, `pid`, `shell`, etc

<<New Screenshot
![Shell event](/sysdig/courses/secure/secure-lab08/assets/shell_event.png)

Similarily, if you select `kube exec` from the 'Datasource' search box, we can see details of a command executed against the Kubernetes cluster (as opposed within an actual container)


To look at what commands were executed, click on the `View commands` button.


<<New Screenshot
![Commands Audit](/sysdig/courses/secure/secure-lab08/assets/commands_audit.png)
