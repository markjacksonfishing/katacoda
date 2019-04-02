Sysdig Falco is an open source, behavioral monitoring software designed to detect anomalous activity. Sysdig Falco works as a intrusion detection system on any Linux host. It also support kubernetes-specific context like **k8s.deployment.name**, or **namespaces** for its rules.

If you have not done it yet, it's a good idea to complete the [Sysdig Falco: Container security monitoring](https://katacoda.com/sysdig/scenarios/sysdig-falco) scenario before this one.

In this lab you will learn the basics of Sysdig Falco and how to use it along with a Kubernetes cluster to detect anomalous behavior.

This scenario will cover the following security threats:

- Unauthorized process
- Write to non authorized directory
- Processes opening unexpected connections to the Internet

You will play both the attacker and defender (sysadmin) roles, verifying that the intrusion attempt has been detected by Sysdig Falco.
