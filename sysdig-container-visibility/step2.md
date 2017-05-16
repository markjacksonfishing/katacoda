Sysdig can be deployed as a container onto a Docker Host to provide additional visibility and debugging information.

## Task

`docker run -it --rm --name=sysdig --privileged=true \
   --volume=/var/run/docker.sock:/host/var/run/docker.sock \
   --volume=/dev:/host/dev \
   --volume=/proc:/host/proc:ro \
   --volume=/boot:/host/boot:ro \
   --volume=/lib/modules:/host/lib/modules:ro \
   --volume=/usr:/host/usr:ro \
   sysdig/sysdig`{{execute}}

## List all available chisels

Describe chisel

`sysdig -cl`{{execute}}
