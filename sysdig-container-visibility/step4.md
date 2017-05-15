## List All Network Traffic

`sysdig -pc -c topcontainers_net`{{execute}}

## List Top Network Traffic

`sysdig -pc -c topprocs_net`{{execute}}

## List Top Connections

`sysdig -pc -c topconns`{{execute}}

## List Network By Containers

`sysdig -pc -c topconns container name=mysql`{{execute}}

## List All New Connections

`sysdig -p"%fd.name" container.name=mysql and evt.type=accept`{{execute}}
