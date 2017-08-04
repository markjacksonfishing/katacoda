One of the hardest things to do when troubleshooting Linux systems in general and container-based infrastructures in particular is observing the data that processes and/or containers are exchanging, not only at the network level but also at the file level. Because now we know what we have executing, we have an approximate idea where we want to dig deeper. Let's see a few examples:

## Reconstruct the resolv.conf used by Apache

_cecho_fds_ is one of the most useful chisels, allows to trace the data sent on the filtered file descriptors, either network or file system activity:

`sysdig -c echo_fds "fd.filename=resolv.conf and container.name=wp1"`{{execute}}

## Watch HTTP requests to one of the containers

`sysdig -s 2048 -A -c echo_fds "fd.port=80 and container.name=wp1"`{{execute}}

_Note: -s 2048 incrases the buffer size to print all the information._

## Find out the files being read and written by Apache

`sysdig -c topfiles_bytes "fd.type=file and container.name=wp1 and proc.name=apache2"`{{execute}}

## List the clients connected to MySQL, by established connections

`sysdig -c fdcount_by fd.cip "evt.type=accept and container.name=mysql and proc.name=mysql"`{{execute}}

## Traffic Between Two Containers

`MYSQL=172.18.0.2 WP=172.18.0.3
sysdig -pc -A s 2048 -c echo_fds "fd.ip=$MYSQL and fd.ip=$WP"`{{execute}}

## Analyze MySQL and Apache activity

System calls run by Apache and MySQL processes, filtering out some noise calls we are not interested in:

`sysdig -v "proc.name=apache2 and proc.name=mysqld and evt.type!=gettimeofday and evt.type!=switch and evt.type!=io_getevents and evt.type!=futex and evt.type!=clock_gettime and evt.type!=epoll_wait and evt.type!=getsockopt and evt.type!=wait4 and evt.type!=select and evt.type!=semop"`{{execute}}

_Note: -v makes output verbose, full content of buffers is printed on the screen._

