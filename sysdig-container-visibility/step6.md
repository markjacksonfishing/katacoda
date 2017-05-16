One of the hardest things to do when troubleshooting container-based infrastructures is observing the data that containers are exchanging

## Traffic From One Container

While this next example will show the data sent and received by the wordpress1 container on port 80:

`sysdig -A -cecho_fds container.name=wp1 and fd.port=80`{{execute}}

## Traffic Between Two Containers

`MYSQL=172.18.0.2
WP=172.18.0.3
sysdig -pc -A -c echo_fds "fd.ip=$MYSQL and fd.ip=$WP"`{{execute}}
