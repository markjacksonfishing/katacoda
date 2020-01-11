Image scanning alerts, like all Sysdig alerts, can be configured to notify users when an issue in the infrastructure arises. Scanning alerts can be created for static images in the repository or for running (runtime) images. Scanning alerts focus on when unscanned images are added to the environment, images fail a policy evaluation, scanning results change, or CVEs are updated.

Examples of when users might implement alerts:

 - I want to know if there are new CVE updates for the 3 different images I handle

 - I want to be notified if any of the common images from docker hub that are used all over my organization have a policy status that has changed

Click on `Image Scanning > Alerts`.

There are two types of alerts - *Runtime* alert and *Repository* alert.

 - Use Runtime alerts to scan running images and trigger a notification in case of a policy violation, status change, or unscanned image added to the environment.

 - Use Repository alerts to scan static images in the repository and trigger a notification in case of a policy violation, status change, or a new image added to the environment.

# Runtime Alert

Click ‘Add Alert’, then select 'Runtime Alert'.

![Runtime Alert](secure-image-scanning-policies-and-assignments/assets/Alert01.png)

 - Set the name to 'Training Runtime Alert'

 - The 'Description' is arbitrary text

 - For 'Scope' select `kubernetes.deployment.label` `is` `web-app`

    Leaving the 'Scope' field blank implies the alert will be raised across the entire infrastructure.  In a live environment you may wish to narrow the scope of the alerts.  The scope may be based on various metadata related to, for example, container, kubernetes, host, cloud or OS specific.

 - For 'Trigger', choose `Unscanned Image`, then `Scan Image` form the drop down list. This will automatically scan any detected image within the deployment.  The other alternative is to send an alert, but don't automatically scan the images.

  The 'Scan Results Change' option allows you to be notified when an image that had previously passed now fails its policy evaluation, or when there is any change on a previously scanned image result.

  The CVE UPDATE option will send an alert whenever a vulnerability is added, updated, or removed from a running image.

 - For 'Notification' select a configured notification channel (e.g. email) to be used for alert notifications. If no notification channels have been defined for your Sysdig Secure environment yet, see [Set Up Notification Channels](https://docs.sysdig.com/en/set-up-notification-channels.html).

 Click Save.

# Repository Alert
