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

 - Set the name to 'Training Runtime Alert'

 - The 'Description' is arbitrary text

 - For 'Scope' select `kubernetes.namespace.label` `is` `web-app`

    Leaving the 'Scope' field blank implies the alert will be raised across the entire infrastructure.  In a live environment you may wish to narrow the scope of the alerts.  The scope may be based on various metadata related to, for example, container, kubernetes, host, cloud or OS specific.

 - For 'Trigger', choose `Unscanned Image`, then `Scan Image` form the drop down list. This will automatically scan any detected image within the deployment.  The other alternative is to send an alert, but don't automatically scan the images.

  The 'Scan Results Change' option allows you to be notified when an image that had previously passed now fails its policy evaluation, or when there is any change on a previously scanned image result.

  The CVE UPDATE option will send an alert whenever a vulnerability is added, updated, or removed from a running image.

 - For 'Notification' select a configured notification channel (e.g. email) to be used for alert notifications.

  *Note* If no notification channels have been defined for your Sysdig Secure environment yet, see [Set Up Notification Channels](https://docs.sysdig.com/en/set-up-notification-channels.html).

![Runtime Alert](secure-image-scanning-policies-and-assignments/assets/Alert01.png)

Click Save.

Now introduce a new container, and see if it scans and you get a notification. Run the following command

```
kubectl apply -f manifests/nginx-2.yaml -n web-app
```
This updates the `web-app` deployment with a more recent version of `nginx`, which should automatically get scanned.

# Repository Alert

Repository Alerts are similar to Runtime Alert, but are invoked when scanning images in a repository as opposed to running in an environment.

For this example we will scan an image in the repository that we have not yet scanned, `learnsysdig/node:10.8.0`.

Click ‘Add Alert’, then select 'Repository Alert'.

- Set the name to 'Training Repository Alert'

- The 'Description' is arbitrary text

- For 'Registry/Repo:Tag' enter `docker.io`, `learnsysdig/node`, and `10.8.0`.

- For 'Trigger', choose `New Image Analyzed`

 - For 'Notification' select a configured notification channel (e.g. email) to be used for alert notifications.

![Repository Alert](secure-image-scanning-policies-and-assignments/assets/Alert02.png)

Click Save.

Now go to `Image Scanning` > `Scan Results`, click `Scan Image` and enter the image details, i.e. `learnsysdig/node:10.8.0`

![Scan Node Image](secure-image-scanning-policies-and-assignments/assets/Alert03.png)

You should see a note that the scan is "in progress".  

Once complete you can click on the image name to drill down on the scan results.  

Shortly after you should receive an email alert.
