Choose a grouping 'Kubernetes (Deployments)', find the web-app or nginx deployment.

![Find unscanned image](/sysdig-devel/courses/scvs/lab06/assets/16_unscanned.png)

Click on the unscanned image name and you can now choose ‘Scan Now’. Again, this will scan against the default policy.

![Scan now](/sysdig-devel/courses/scvs/lab06/assets/17_scan_now.png)

Even though the alert we configured earlier will scan this image eventually, we don’t want to wait so by clicking ‘Scan Now’ we send it immediately to the scanning engine rather than it being somewhere in the queue. You’ll now see the status changed to ‘Analysis in progress...’.

![Progress](/sysdig-devel/courses/scvs/lab06/assets/18_progress.png)

And if you wait a minute or two, then refresh the page this should change to show the results of the scan, which should be ‘Failing’.
