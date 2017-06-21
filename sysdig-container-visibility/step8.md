 `sysdig -w capture.scap`{{execute}}

 <kbd>CTRL</kbd>+<kbd>C</kbd>


 `sysdig -r capture.scap`{{execute}}

 `sysdig -r capture.scap -c lscontainers`{{execute}}

 `sysdig -r capture.scap proc.name=mysql`{{execute}}

 `sysdig -r capture.scap -A -cecho_fds container.name=wp1 and fd.port=80`{{execute}}
