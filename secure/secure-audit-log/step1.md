
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
