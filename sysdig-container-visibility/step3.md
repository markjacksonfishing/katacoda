Sysdig has filters that allow you to distill specific system calls (information) in a similar fashion to tcpdump.

Example: list all system calls related to files under /etc

`sysdig "fd.name contains /etc"`{{execute}}

Sysdig chisels take all this information available through the system calls and aggregate it to display a summarized report.

Example: list all running containers (identifies executed system calls in different user namespaces and reports the container name for each namespace)

`sysdig -c lscontainers`{{execute}}

## Understanding Sysdig filters

You can filter using information from different sources: system calls and events, file descriptors (not only files or sockets but higher level concepts like file names, directories or IP addresses), process name, uid, pid, latency and many more. You can get the full list running `sysdig -l`{{execute}}.

What makes Sysdig special is the ability to filter based on Docker container information using filters like like container.id, container.name, container.mounts. But can also understand Kubernetes resources like (namespaces, services, deployments or pods), Mesos tasks and Marathon apps or groups.

## Understanding Sysdig chisels

Because all the system calls information would be too much for an individual to process, Sysdig has created chisels. A chisel enables users to take the stream of data captured by Sysdig and only display the relevant, aggregated data.

You have available chisels to report on system state, applications protocols like HTTP or memcached, CPU usage, errors, I/O activity, logging (file or syslog), network activity, performance bottlenecks or security.

To view all the chisels available, run the command `sysdig -cl`{{execute}}
