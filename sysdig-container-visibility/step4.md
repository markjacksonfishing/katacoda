Displaying CPU provides us with an insight into which containers are causing load. However, when debugging potential issues and understanding an application deployment, it's important to have access to additional metrics.

Sysdig includes the ability to display the total network traffic on a system and view per container.

## List All Container Network Traffic

The chisel _topcontainers_net_ provides an excellent overview of which containers are consuming the most network bandwidth. This is helpful to identify the cause of potential bottlenecks on the network.

`sysdig -pc -c topcontainers_net`{{execute}}

## List Top Network Traffic Containers

Similar to CPU, the _topprocs_net_ chisel outputs the network utilization by a process to provide a deeper understanding of what's happening within the container.

`sysdig -pc -c topprocs_net`{{execute}}

## List Network Connections By Containers

The chisel _topconns_ allows users to identify network connections in/out of containers. This offers a single pane of glass for all the connections in this machine, no matter which container they belong to.

`sysdig -pc -c topconns`{{execute}}
