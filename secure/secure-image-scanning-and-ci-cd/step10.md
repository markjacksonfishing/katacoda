Once the plugin has finished scanning the image, the report seen in Jenkins should be also available in Sysdig Secure.

For each image that has been scanned, there is an entry in **Image Scanning** → **Scan Results**.

Click in the image and you will see all the information about the scan.

![Repositories](/sysdig/courses/secure/secure-image-scanning-and-ci-cd/assets/image22.png)

In the left panel click **DefaultPolicy** and select the **Rules** tab, you will find all the information about what did not succeed from the policy applied:

![Policy Rules](/sysdig/courses/secure/secure-image-scanning-and-ci-cd/assets/image23.png)

In the **Vulnerabilites** option in the left panel you will be able to see all the Operating System (base image) vulnerabilities:

![OS vulnerabilities](/sysdig/courses/secure/secure-image-scanning-and-ci-cd/assets/image24.png)

In the same tab you can see the Non Operating System (application) vulnerabilities. As Sysdig Secure has the CVE and Snyk vulnerability databases, it can also scan the libraries that our programs include:

![Full CVEs](/sysdig/courses/secure/secure-image-scanning-and-ci-cd/assets/image25.png)
