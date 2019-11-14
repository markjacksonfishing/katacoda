
Considering the container density and turnover rate for any non-trivial deployment, the SecOps team cannot realistically produce runtime rules for every image. Sysdig automates away that process out of the box.

Sysdig kernel-level instrumentation generates runtime profiles that are much more detailed and accurate than the average manual rule. This translates into more strict runtime controls, where everything that is not explicitly allowed will be flagged.

!!Screenshot!!

Sysdig uses its syscall-level understanding to gain deep insights into container runtime behavior such as:

 - Spawned process – which process and binaries are running?
 - Network traffic – what TCP/UDP ports does this application communicate on?
 - File system activity – what files are being read? And written?
 - System calls – what system calls are executed?

Sysdig allows the user to cherry-pick the sections of the profile that look more relevant and automatically generate a runtime policy that imports them.

Lets see this feature in action.
