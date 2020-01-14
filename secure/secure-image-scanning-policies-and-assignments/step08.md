Let's now not turn our attention to configuring the scan itself. Up to now we've been focusing on configuring image registries, scanning images and scan results.  But what is the scan actually looking for and what OS and 3rd party vulnerabilities and misconfigurations will get flagged?

Images get scanned against one or more "Policies". These Policies define a group of rules, or checks, that are invoked during the image scan.  You can see the configured scanning policies by selecting `Image Scanning > Policies`.

![Policies](secure-image-scanning-policies-and-assignments/assets/Policies01.png)

By default, all images will get scanned against the "default policy", but this is configurable.  Below is an example of the 'DefaultPolicy'.

![DefaultPolicy](secure-image-scanning-policies-and-assignments/assets/DefaultPolicy.png)

Each policy consists of a name, as description, and one or more "rules".  Rules consists of a "Gate" and a "Trigger" and an "Action". For a complete description of all the Gates and Triggers, please refer to the [Sysdig Documentation](https://docs.sysdig.com/en/scanning-policy-gates-and-triggers.html).

Under ‘Image Scanning’ > ‘Policies’, click the menu to the left of *NIST 800-190* policy, select 'Duplicate Policy' and change the name of the policy to 'Default Audit Policy - NIST 800-190 (training)'.

![Default Audit Policy - NIST 800-190](secure-image-scanning-policies-and-assignments/assets/Policies05.png)

This particular policy interprets *NIST 800-190* controls and provides out of the box rules to detect image misconfiguration.  We will make two changes to this new policy 'Default Audit Policy - NIST 800-190 (training).

1. Against the OS vulnerability check, change the `Warn` option to `Stop`

2. For the non-OS vulnerability check, click the rules, set the *Severity* to *Medium*, and change the `Warn` option to `Stop`

![Stop Action](secure-image-scanning-policies-and-assignments/assets/Policies06.png).

Click *Save*.
