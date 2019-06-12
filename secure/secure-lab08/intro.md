Sysdig Secure is a unified data platform that provides vulnerability management, compliance, runtime security
and forensics for enterprise cloud native environments at scale.

It is designed to provide container run-time security and forensics for enterprises with distributed, dynamic services.
Sysdig Secure comes with deep container visibility and a natural integration with key orchestration
technologies like Kubernetes, Docker, OpenShift, Amazon ECS…

It shares the same instrumentation as Sysdig Monitor, the exact same analytics backend, and consistent UIs.
We call this reusable goodness the Sysdig Container Intelligence Platform – a unified approach to secure, monitor, and
troubleshoot your container environment.

In this scenario we will use Sysdig Secure to detect anomalous activity, and research the incident, even if the
affected container no longer exist.

Goals
-----

- Explore the default policies
- Customize a policy to do a capture of all syscalls happening around a security event
- Use Sysdig Secure to detect an interactive shell in a container
- Investigate the incident, and find out exactly what happened.

Competencies required
---------------------

If you have not done it yet, it is a good idea to complete the [Falco](https://katacoda.com/sysdig/courses/falco)
scenarios before this one.

You will play both the attacker and defender (sysadmin) roles, verifying that the intrusion attempt has been detected
by Sysdig Secure.
