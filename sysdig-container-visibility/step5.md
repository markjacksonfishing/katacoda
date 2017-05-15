## Top Containers

`sysdig -c topcontainers_file`{{execute}}


## Top Processes

`sysdig -pc -c topprocs_file`{{execute}}


## Top Bytes

`sysdig -pc -c topfiles_bytes`{{execute}}

## Writing To Files

`sysdig -pc -c echo_fds "fd.name=/etc/passwd"`{{execute}}
