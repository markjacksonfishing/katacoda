
Sysdig Baseline Image Profiles allows you to create strict whitelist-based runtime rules for every container in my environment.

If you run hundreds of different images, automating the process is a must. Baselining provides a level of visibility and runtime insight that is far more accurate than the average manual rule.

Considering the container density and turnover rate for any non-trivial deployment, the SecOps team cannot realistically produce runtime rules for every image. Sysdig automates away that process out of the box.

Sysdig kernel-level instrumentation generates runtime profiles that are much more detailed and accurate than the average manual rule. This translates into more strict runtime controls, where everything that is not explicitly allowed will be flagged.

Generated profiles are divided into different runtime sections (network, filesystem, etc). Sysdig allows the user to cherry-pick the sections of the profile that look more relevant and automatically generate a runtime policy that imports them.
