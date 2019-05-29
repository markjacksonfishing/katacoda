Once the plugin has finished scanning the image, the report seen in Jenkins should be also available in Sysdig Secure.

For each image that has been scanned, there is an entry in **Image Scanning** → **Repositories**.

Click in the image and you will see all the information about the scan.

![Repositories](/sysdig/scenarios/secure-lab07/assets/image22.png)

In the tab **Policy** you will find all the information about what did not succeed from the policy applied:

![Policy Rules](/sysdig/scenarios/secure-lab07/assets/image23.png)

In the **Vulnerabilites** tab you will be able to see all the Operating System (base image) vulnerabilities:

![OS vulnerabilities](/sysdig/scenarios/secure-lab07/assets/image24.png)

In the same tab you can see the Non Operating System (application) vulnerabilities. As Sysdig Secure has the CVE and Snyk vulnerability databases, it can also scan the libraries that our programs include:

![Full CVEs](/sysdig/scenarios/secure-lab07/assets/image25.png)
