One of the hardest things to do when troubleshooting Linux systems in general and container-based infrastructures in particular, is observing the data that processes and/or containers are exchanging. Not only at the network level but also at the file level. Let's see a few examples:

## Watch HTTP requests to each of the containers

When trying to inspect network traffic, we might be used to `tcpdump`, but what if we could filter easily by container name? Here we have a load-balanced scenario and we want to look at the HTTP requests to each of the Wordpress servers. Sysdig has a chisel to pretty print them :).

`sysdig -pc -c httplog`{{execute}}

## Reconstruct the /etc/hosts file used by Apache

Sometimes we need to troubleshoot DNS resolution inside containers. Because `/etc/resolv.conf` and `/etc/hosts` are generated at run time, these might change without our control. Let's use Sysdig to find out what Apache reads from the `/etc/hosts` file.

*cecho_fds* is one of the most useful chisels, allows to trace the data sent on the filtered file descriptors, either network or file system activity.

`sysdig -c echo_fds "container.name=wp1 and fd.name=/etc/hosts"`{{execute}}

## Find out the files being open by Apache under /var/www

HTTP requests come through, DNS resolutions works, but is the webserver actually opening the files we expect it to do? This is how we can find out.

`sysdig "container.name=wp1 and fd.type=file and evt.type=open and fd.name contains /var/www and proc.name=apache2"`{{execute}}

## Traffic between two containers

If we want to look at the SQL protocol, we can find it filtering the network traffic between the containers:

`sysdig -c echo_fds fd.ip=172.18.0.2 and fd.ip=172.18.0.3`{{execute}}

## Looking inside the system calls

But what if we want to filter out only SQL queries to the `wp_posts` table? We can filter on the buffer content too.

`sysdig -s 2048 -c echo_fds "proc.name=mysqld and evt.buffer contains wp_post"`{{execute}}

_Note: -s 2048 increases the buffer size to capture all the information._

## Analyze MySQL and Apache activity at the lowest level

Can we go even deeper? This will show all system calls run by Apache and MySQL processes, filtering out some noise calls we are not interested in:

`sysdig -v -A -s 2048 "(proc.name=apache2 or proc.name=mysqld) and evt.type!=gettimeofday and evt.type!=switch and evt.type!=io_getevents and evt.type!=futex and evt.type!=clock_gettime and evt.type!=epoll_wait and evt.type!=getsockopt and evt.type!=wait4 and evt.type!=select and evt.type!=semop"`{{execute}}

_Note: -v makes output verbose, full content of buffers is printed on the screen._

If you are hungry for more Sysdig usage examples, have a look at [Sysdig Wiki > Examples](https://www.sysdig.org/wiki/sysdig-examples/).
