Sysdig Secure allows users to define CVEs and images as globally trusted or blacklisted. For example, a low-risk CVE can be globally approved to prevent it from impacting builds that include more critical fixes. Alternatively, specific images can be marked as globally approved or not to ensure they always/never pass a scan.

There are two ways to add an image to whitelist or a blacklist
 - directly via `Image Scanning` > `Global - Trusted Image` or `Global - Blacklisted Image`
 - Clicking `Add to List` in the 'Scan Results' screen

*Note* If an image is added both in the "Trusted Images" list and in the "Blacklisted Image" list, the blacklisted one takes precedence.

For illustration let's whitelist our passing `learnsysdig/nginx:1.17.0` image and blacklist our failing `learnsysdig/dummy-vuln-app` image.

## To add to the Global Image Whitelist & Blacklist

1. Navigate to `Image Scanning` > `Scan Results` and select the image `learnsysdig/nginx:1.17.0`

1. CLick `Add to List` on the top right, then choose 'Add Image to Trusted Images'

![Whitelist an Image](secure-image-scanning-policies-and-assignments/assets/whitelist01.png)

1. Navigate to `Image Scanning` > `Global - Trusted Image`. You should see the newly whitelisted image listed as `docker.io/learnsysdig/nginx:1.17.0`

We will add the `learnsysdig/dummy-vuln-app` image to the blacklist by the other method

1. Navigate to `Image Scanning` > `Global - Blacklisted Image`.  The list should initially be empty.

1. Click 'Add Image', then enter `learnsysdig/dummy-vuln-app` into the dialog box

   ![Blacklist an Image](secure-image-scanning-policies-and-assignments/assets/blacklist02.png)

   You should see the newly blacklisted image listed as `docker.io/learnsysdig/dummy-vuln-app:latest`

1. Click 'Save'

## To add to the CVE Whitelist
1. Navigate to `Image Scanning` > `CVE Whitelist`. If not previous CVEs have been added to the whitelist, then you will see a notification as sush. Click 'Add CVE'

1. Add each CVE in a comma-separated list, then click Ok to save

    ![Whitelist CVEs](secure-image-scanning-policies-and-assignments/assets/whitelist_cve_01.png)

*Note* Those CVEs displayed above are for illustration purposes only, and not a recommendation that they should be whitelisted.
