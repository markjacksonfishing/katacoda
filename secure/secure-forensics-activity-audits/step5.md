
Let's now play the sysadmin role, and investigate the incident.  Open the Sysdig Secure window on the right pane, and click on *Activity Audit* on the left menu.

![Activity Audits](/sysdig/courses/secure/secure-forensics-activity-audits/assets/image02.png)

The area on the left of the screen defines the scope. You can define here how you'd like to view your environment, for example physically by hosts and containers, or logically by deployments and pods. For now, select *'Deployments and Pods (starting with Clusters)'*, then click on 'Activity Audits Training'

![Groupings](/sysdig/courses/secure/secure-forensics-activity-audits/assets/image03.png)

The second area to note is the activity graph timeline.  This gives you a visual representation of activity on the system. The 'Filters' and 'Datasources' boxes allow you to restrict the content in view. There are 3 datasources available

 - `cmd` - View commands execututed directly on the container
 - `net` - View network activity
 - `kube exec` - View commands executed against the Kubernetes API

Below the graph you see the actual commands that were initiated, categorized as `cmd`, `net` or `kube exec` as outlined above.  You will quickly see here some entries related to our malicious activity.

At the bottom of the screen you will see the time window selector. Click on '10M' (i.e. 10 minutes of activity)  

Clicking on a specific command we can see more details on the command itself. Click on `curl` entry.

![Drilling Down](/sysdig/courses/secure/secure-forensics-activity-audits/assets/image04.png)

On the right pane you will now see more information on the executed command, namely

 - the 'time' the event occured
 - the 'full command line' details
 - the 'working directory' the command was executed from
 - the Kubernetes 'scope' that was (namespace, deployment, pod)
 - the physical 'host' on which it occurred
 - 'additional details', including the `uid`, `pid`, `shell`, etc

The text in blue on this screen indicate these lines may be included in a filter. Hover over the `curl` on the right pane, and click the '+' icon, and you will see `comm="curl"` added to the Filters box.

![Add to filter](/sysdig/courses/secure/secure-forensics-activity-audits/assets/image05.png)

**Note** Clicking on the '-' adds  `comm!="curl"` to the Filters box. That is to say, it does not remove `curl` from the filters, but the search is for entries that specifically *excludes* `curl`.

![Shell event](/sysdig/courses/secure/secure-lab08/assets/shell_event.png)

Similarily, if you select `kube exec` from the 'Datasource' search box, we can see details of a command executed against the Kubernetes cluster (as opposed within an actual container)

To look at what commands were executed, click on the `View commands` button.
