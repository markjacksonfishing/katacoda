## List All Containers
`sysdig -c lscontainers`{{execute}}

## List Top Containers

`sysdig -c topcontainers_cpu`{{execute}}

## Containers based on Name

`sysdig -pc -c topprocs_cpu container.name contains wordpress`{{execute}}
