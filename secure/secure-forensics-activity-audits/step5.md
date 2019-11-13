# The Forensics

Let's now play the sysadmin role, and investigate the incident.

The first area of the screen is the scope. You can define here how you'd like to view your environment, for example physically by hosts and containers, or logically by deployments and pods.

For now, select **Deployments and Pods**

The second area to note is the time graph of activity.  This gives you a visual representation of activity on the system. The 'Filters' and 'Datasources' boxes allow you to restrict the content in view. There are 3 datasources available

 - `cmd` - View commands execututed directly on the container
 - `net` - View network activity
 - `kube exec` - View commands executed against the Kubernetes API


Below the graph you see the actual commands that were initiated, categorized as `cmd`, `net` or `kube exec` as outlined above.  You will see here that someone spawned a **terminal shell in a container.**  

Clicking on a specific command we can see more details on the command itself.  Click on **WHICH ONE**

time
full command line
working directory
scope
host
additional details

<<New Screenshot
![Shell event](/sysdig/courses/secure/secure-lab08/assets/shell_event.png)

To look at what commands were executed, click on the `View commands` button.

<<New Screenshot
![Commands Audit](/sysdig/courses/secure/secure-lab08/assets/commands_audit.png)
