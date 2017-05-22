The _spy_logs_ chisel shows all the I/O buffers that are written to files ending in .log or _log, inside or outside containers. This provides an aggregated view of all the containers running on the system.

## Tail Container Logs

`sysdig -pc -c spy_logs`{{execute}}
