Image scanning alerts, like all Sysdig alerts, can be configured to notify users when an issue in the infrastructure arises. Scanning alerts can be created for static images in the repository or for running (runtime) images. Scanning alerts focus on when unscanned images are added to the environment, images fail a policy evaluation, scanning results change, or CVEs are updated.

Examples of when users might implement alerts:

 - I want to know if there are new CVE updates for the 3 different images I handle

 - I want to be notified if any of the common images from docker hub that are used all over my organization have a policy status that has changed

 Click on `Image Scanning > Alerts`, then ‘Add Alert’.
