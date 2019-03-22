To get started, let's explore what is currently happening and identify which containers are executing workload and processing the responses.

## List CPU usage per container

`sysdig -c topcontainers_cpu`{{execute}}

## Top CPU usage processes running

We can then drill deeper to look at the CPU usage of each process running inside the containers:

`sysdig -pc -c topprocs_cpu`{{execute}}

_Note: The -pc flag makes sysdig tell us which container each connection belongs to._

## List network traffic per container

`sysdig -pc -c topcontainers_net`{{execute}}

## Top network traffic processes running

`sysdig -pc -c topprocs_net`{{execute}}

## Network connections

`sysdig -pc -c topconns`{{execute}}

## List IO usage per container

`sysdig -c topcontainers_file`{{execute}}

## Top I/O usage processes running

`sysdig -pc -c topprocs_file`{{execute}}

But how to use these to resolve real life performance and error troubleshooting issues? Let's use filters too!
