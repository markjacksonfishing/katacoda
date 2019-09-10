Sysdig is an open source tool for deep system visibility that comes with container native support.

Think of all the system health and performance monitoring tools you used for troubleshooting, but working together and container-aware:

- strace
- tcpdump
- htop
- iftop
- lsof
- and way more... awesome sauce.

This means that you can gain visibility inside the containers, and filter or aggregate metrics using container names/ids or your orchestration tool resources (Kubernetes pods, deployments, etc or Mesos tasks and Marathon apps and groups).

In this scenario, you will learn how to gain container visibility on a simple Docker-based Wordpress deployment through some basic and cool examples. We are going to cover:

- How Sysdig works, using filters and chisels.
- Basic container and containerized processes exploration: monitoring CPU, network, file I/O, etc.
- Troubleshooting use cases in a Wordpress scenario.
