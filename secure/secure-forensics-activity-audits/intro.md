
Sysdig's Kubernetes Activity Auditing provides a chronological sequence of user and/or system activity on the Kubernetes cluster. This information can be used to investigate the actions taken (either by a Kubernetes user or by the system) around a specific point in time, perhaps of any security policy event.  For example, it could be used to trace a `kubectl exec` user interaction and list all the command and network activity that happened inside the pod.

This features allows Sysdig Secure to correlate the interactive requests from a Kubernetes user with the commands and network connections performed inside the container, allowing the operator to trace this activity back to a user identity.

It allows cluster administrator to answer the following questions:

 - What happened? (i.e. resource was created, listed, modified, deleted)
 - When did it happen?
 - Who initiated it (Kubernetes user or software service account)?
 - On what Kubernetes resource did it happen?

This feature is critical, not only for traceability and compliance reasons, but also to aid fast incidence response.  
