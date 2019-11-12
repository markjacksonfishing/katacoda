
Kubernetes auditing provides a security-relevant chronological set of records documenting the sequence of activities that have affected system by individual users, administrators or other components of the system. These Kubernetes audit log events are formatted using JSON.

It allows cluster administrator to answer the following questions:

 - What happened? (i.e. resource was created, listed, modified, deleted)
 - When did it happen?
 - Who (Kubernetes user or software service account) initiated it?
 - On what Kubernetes resource did it happen?

For Example
 - Kube-user ‘john-doe’ deleted the ‘redis-config’ Kubernetes ConfigMap, in the ‘redis’ namespace at 10amPST
 - “sysdig-agent” service account in the “sysdig-agent” namespace listed the cluster namespaces at 10amPST

```
Capture system activity and make it searchable and indexable against Kubectl activity
Easily filter through any useror service interaction across the K8s stack
Comply with SOC2, PCI, ISO, HIPAA, etc. audit

```
