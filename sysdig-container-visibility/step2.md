Sysdig works by capturing system calls being made within the Linux Kernel. This provides Sysdig with unique visibility into how applications are operating even inside containers and highlight key metrics to assist system debugging and monitoring. Think of wireshark for your entire system, not only network activity, that understands the Docker containers and other orchestration tools that you use.

Sysdig can operate both on the real-time data from a system, or on previously captured data. This allows users to debug in real-time, but also capture data that can be processed later on, when a container doesn't exist anymore or shared with other members of the team.

## Task

Sysdig can be installed as a package but also deployed as a container onto the Docker host:

`docker run -it --rm --name=sysdig --privileged=true \
   --volume=/var/run/docker.sock:/host/var/run/docker.sock \
   --volume=/dev:/host/dev \
   --volume=/proc:/host/proc:ro \
   --volume=/boot:/host/boot:ro \
   --volume=/lib/modules:/host/lib/modules:ro \
   --volume=/usr:/host/usr:ro \
   sysdig/sysdig`{{execute}}

Once we run Sysdig, will capture and display information about all system calls and events on the system. This includes timestamp, CPU where it was executed, process name, thread ID, event type and all the relevant arguments. This is what can see when running `sysdig`{{execute}} inside of the Sysdig container.

_Note: (finish it with <kbd>CTRL</kbd>+<kbd>C</kbd>)._

All this information can be too much for an individual to process, that's why Sysdig offers filters and little reporting and aggregation scripts known as chisels. Let's learn how to use them with a few examples!
