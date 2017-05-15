
## Traffic From One Container

While this next example will show the data sent and received by the wordpress1 container on port 80:

`sysdig -A -cecho_fds container.name=wordpress1 and fd.port=80`{{execute}}

## Traffic Between Two Containers


`CONTAINER_A=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' mysql)
CONTAINER_B=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' wordpress1)
sysdig -pc -A -c echo_fds "fd.ip=$CONTAINER_A and fd.ip=$CONTAINER_B"`{{execute}}
