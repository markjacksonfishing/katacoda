## List All Container Network Traffic

This gives us a nice overview of which containers are consuming the most network bandwidth

`sysdig -pc -c topcontainers_net`{{execute}}

## List Top Network Traffic Containers

We can also see network utilization broken up by process

`sysdig -pc -c topprocs_net`{{execute}}

## List Network Connections By Containers

`sysdig -pc -c topconns`{{execute}}
