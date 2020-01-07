Image scanning alerts, like all Sysdig alerts, can be configured to notify users when an issue in the infrastructure arises. Scanning alerts can be created for static images in the repository or for running (runtime) images. Scanning alerts focus on when unscanned images are added to the environment, images fail a policy evaluation, scanning results change, or CVEs are updated.

Examples of when users might implement alerts:

"I want to know if there are new CVE updates for the 3 different images I handle."

"I want to be notified if any of the common images from docker hub that are used all over my organization have a policy status that has changed."

Let's setup an alert that detects any new image that hasn’t been scanned (i.e. all of them), and then create an action that automatically scans the image.

Click on ‘Image Scanning’ → ‘Alerts’, then ‘Add Alert’ → ‘Runtime Alert’.

![Add alert](/sysdig-devel/courses/scvs/lab06/assets/08_add_alert.png)

Fill out the form, make sure to select a trigger to ‘Scan Image’. If you like you can also set a notification to send an email to yourself. Click ‘Save’.

![New alert](/sysdig-devel/courses/scvs/lab06/assets/09_new_alert.png)

Make sure to enable the alert once you’ve created it. This will now scan all images against the default policy when it detects they haven’t yet been scanned.

![Enable alert](/sysdig-devel/courses/scvs/lab06/assets/10_enable.png)

In a minute or two you should get a notification (if you created on) that unscanned images were found.

![Notification](/sysdig-devel/courses/scvs/lab06/assets/11_notification.png)

> **ToDo: I didnt receive this summary email ^^ - just an individual email for each container.  Has this process changed and should we delete this, or have I missed a step?**
> IDK. I didn't get any mail whatsoever :-(  Q.

And slowly the images will be scanned and the results page updated to show the scan progress and results.

![Progress](/sysdig-devel/courses/scvs/lab06/assets/12_progress.png)
