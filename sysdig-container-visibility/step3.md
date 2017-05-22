Under the covers, the Wordpress instance has started to receive traffic. To complete the task, identify which containers are executing workload and processing the responses.

## List All Containers

To gain a top-level view of which containers are executing data we first need to know which containers are currently running. The _lscontainers_ chisel can be used to check what containers are running on your system. This works across multiple container runtimes, for example, both Docker and Rkt.

`sysdig -c lscontainers`{{execute}}

## List CPU Usage Per Container

To identify which containers are processing workload, the _topcontainers_cpu_ chisel lists CPU usage per container.

`sysdig -c topcontainers_cpu`{{execute}}

## Top CPU Processes Running

While the _topcontainers_cpu_ chisel command lists the CPU of a total container, the _topprocs_cpu_ chisel outputs the CPU usage of each process running inside of all the containers. This allows you to identify which processes could be causing high CPU spikes and their associated parent container.

`sysdig -pc -c topprocs_cpu`{{execute}}

_Note: The -pc flag makes sysdig tell us which container each connection belongs to._

## Query Only Certain Containers

Chisels can be combined with filters to only certain container information to be displayed. The command below will only output the CPU usage for containers that have _wp_ within the name.

`sysdig -pc -c topprocs_cpu container.name contains wp`{{execute}}
