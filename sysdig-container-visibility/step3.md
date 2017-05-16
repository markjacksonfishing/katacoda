

## List All Containers

The _lscontainers_ chisel can be used to check what containers are running on your system. This works across multiple container runtimes.

`sysdig -c lscontainers`{{execute}}

## List Total CPU Per Container

The following lists the total CPU per container.

`sysdig -c topcontainers_cpu`{{execute}}

## Top CPU processes running

While the above command lists the CPU of a total container, the next command lists the CPU usage of each process running inside of a container. This allows you to identify which processes could be causing high CPU spikes and their associated parent container.

`sysdig -pc -c topprocs_cpu`{{execute}}

## Query Only For Certain Containers

These queries can be combined with filters, allowing only certain container information to be displayed.

`sysdig -pc -c topprocs_cpu container.name contains wp`{{execute}}
