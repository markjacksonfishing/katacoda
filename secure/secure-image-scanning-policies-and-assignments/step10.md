Policies define what OS, 3rd party package or Dockerfile misconfigurations to consider when scanning an image.  We also need to define the scope on which the scan will be invoked. This aspect is configured through `Image Scanning > Policy Assignments`.

Unless you use a very simple, single-policy approach to scanning, you will probably assign particular policies to particular registries, repositories, or tags.  

For example:

To evaluate all images with a “Prod” tag with your Example Prod Image Policy, use the assignment (`registry/repo/tag`): `*/*/Prod`

To evaluate all images from `gcr.io` with an Example Google Policy, use the assignment (`registry/repo/tag`): `gcr.io/*/*`

From the ‘Image Scanning’ menu select ‘Policy Assignments’.

![Policy Assignments](secure-image-scanning-policies-and-assignments/assets/Assignments01.png)

![Policy Assignments](secure-image-scanning-policies-and-assignments/assets/Assignments02.png)

Click on 'Add Policy Assignment' to add a new Policy Assignment and then fill it out in order to pickup our `learnsysdig` repository and assign the policy ‘nist_800-190’. Put a star in other boxes to match against anything. Then click ‘Save’.

![Add Policiy Assignment](/sysdig-devel/courses/scvs/lab06/assets/05_add_policy.png)

Click *+Add Policy Assignment*. A new entry line appears at the top of the Assignment page, but can be dragged up/down to alter the priority.

Add a new Policy Assignment and then fill it out in order to pickup the `nginx` repository from the `learnsysdig` registry. Assign the policy ‘nist_800-190 (copy)’ you created earlier. Put a star in other boxes to match against anything.

Then click ‘Save’ in the top right.

 ![Policy Assignments](secure-image-scanning-policies-and-assignments/assets/Assignments03.png)

 - `Priority`: Priority is the order of evaluation against the assigned policy. Each new assignment is auto-placed at Priority 1. Once a policy assignment is created and saved, you can change its priority order by dragging it into a new position on the list.

 - `Registry`:Any registry domain (e.g. quay.io ). Wildcards are supported; an asterisk * specifies any registry.

 - `Repository`:Any repository (typically = name of the image). Wildcards are supported; an asterisk * specifies any repository.

 - `Tag`: Any tag. Wildcards are supported; an asterisk * specifies any tag.

 - `Assigned Policy`: Name of policy to use for evaluation. Select from the drop-down menu.
