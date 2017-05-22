To identify how the cluster is operating, you'll need to use Sysdig.

## Task

Sysdig can be deployed as a container onto a Docker Host to provide additional visibility and debugging information.

`docker run -it --rm --name=sysdig --privileged=true \
   --volume=/var/run/docker.sock:/host/var/run/docker.sock \
   --volume=/dev:/host/dev \
   --volume=/proc:/host/proc:ro \
   --volume=/boot:/host/boot:ro \
   --volume=/lib/modules:/host/lib/modules:ro \
   --volume=/usr:/host/usr:ro \
   sysdig/sysdig`{{execute}}

## List all available chisels

When running, Sysdig can capture information about all the commands executing on a system. This information would be too much for an individual to process, and so Sysdig has created chisels. A chisel enables users to take the stream of data captured by Sysdig and only display the relevant, aggregated data.

To view all the chisels available, run the command `sysdig -cl`{{execute}}
