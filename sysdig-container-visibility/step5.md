In the previous steps, it's been possible to identify existing CPU and Network utilization. Another common task is to determine the Disk IO usage of applications.

## Top Containers IO Usage

As with previous chisels, _topcontainers_file_ identifies which containers are causing the highest Disk IO activity.

`sysdig -c topcontainers_file`{{execute}}

## Top Processes

This can be broken down into the processes running inside of each container by using _topprocs_file_.

`sysdig -pc -c topprocs_file`{{execute}}

## Top Bytes

`sysdig -pc -c topfiles_bytes`{{execute}}

## Highest Number of Files

`sysdig -c fdcount_by proc.name "fd.type=file"`{{execute}}

## Writing To Files

`sysdig -pc -c echo_fds "fd.name=/etc/passwd"`{{execute}}

`echo 'test' >> /etc/passwd; sleep 1; echo 'test' >> /etc/passwd; sleep 1; echo 'test' >> /etc/passwd; sleep 1; echo 'test' >> /etc/passwd;sleep 1; echo 'test' >> /etc/passwd`{{execute T2}}
