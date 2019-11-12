
Sysdig Secure parses the live stream of Kubernetes audit information and applies runtime security rules to its events

Additional source of security events complementing system call events
 - Complete visibility of Kubernetes API activity
 - Falco rule language allows you to write customized trigger conditions and security rules

The is an extensive library of OOTB k8s-audit runtime security rules in the Rules Library covering common scenarios, for example
 - Anonymous request to the API
 - Create configmap with private credentials
 - Sensitive host mount point
 - Attach to cluster-admin role

Lets explore the Kubernetes Audit Log feature by way of a hands on example




```
Activity Audit gives IR teams a google-like search experience to investigate across full stack of Kubernetes related audit events. It leverages the high value data from a Sysdig capture file (commands, network connections, etc) and makes it dynamically filterable against Kubectl activity. This allows SOC teams to spot an abnormal kubectl exec into a pod in Kubernetes, then trace all activity (commands run, files touched, outbound connections made to unknown IP’s etc) that occurred over a specific time period. SOC teams can search and filter this data for alert triage -- to determine the cause of the anomaly -- and for incident response. This also provides an audit logging process, a common requirement for Service Organization Control 2 (SOC 2), Payment Card Industry (PCI), International Organization for Standardization (ISO), and Health Insurance Portability and Accountability Act (HIPAA) compliance. Activity Audit allows you to trace and investigate Kube user activity even if the container no longer exists, making Sysdig Secure the only Kubernetes incident response and audit solution available today.
```
