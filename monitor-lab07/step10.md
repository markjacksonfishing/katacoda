Once the plugin has finished scanning the image, the report seen in Jenkins should be also available in Sysdig Secure.

For each image that has been scanned, there’s an entry in Image Scanning > Repositories.

Click in the image and you will see all the information about the scan.

![Repositories](assets/image22.png)

All the information about what did not succeed from the policy applied:

![Policy Rules](assets/image23.png)

Operating System (base image) vulnerabilities:

![OS vulnerabilities](assets/image24.png)

But we can see as well application vulnerabilities, because since we have the full report of CVEs, we can scan also the libraries that our programs include:

![Full CVEs](assets/image25.png)
