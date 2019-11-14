
Sysdig Secure Activity Audit parses the live stream of Kubernetes audit information and applies runtime security rules to its events.

All activity is mapped against specific Kubernetes metadata, such as namespace, deployment and pod. This, along with timestamped records of activity within individual pods, allows teams to quickly troubleshoot exactly what happened, where it happened and who or what instigated it. Essentially it helps join the dots between who ran `kubectl exec` and what exactly happened within the container.

It leverages the high value data from a Sysdig capture file (commands, network connections, etc) and makes it dynamically filterable against Kubectl activity.

This allows SOC teams to spot an abnormal kubectl exec into a pod in Kubernetes, then correlate all activity (commands run, files touched, outbound connections made to unknown IP’s etc) that occurred over a specific time period.  This stream includes:

 - executed commands inside the container
 - network activity (src, dst, sport, dport, no payload)
 - `kubectl exec` requests to the Kubernetes API

 ![Activity Audits UI](/sysdig/courses/secure/secure-policy-editor/assets/image01.png)

SOC teams can search and filter this data for alert triage -- to determine the cause of the anomaly -- and for incident response.

For Example
 - Kube-user 'john-doe' deleted the 'redis-config' Kubernetes ConfigMap, in the 'redis' namespace at 10amPST
 - 'sysdig-agent' service account in the 'sysdig-agent' namespace listed the cluster namespaces at 10amPST

Activity Logging also provides an audit logging process, a common requirement for SOC2, PCI, ISO, and HIPAA compliance, and allows you to trace and investigate Kube user activity even if the container no longer exists.

Lets explore the Kubernetes Audit Log feature by way of a hands on example.
