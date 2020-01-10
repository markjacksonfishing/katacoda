
Click `Image Scanning` > `Scan Results` screen, then click `learnsysdig/dummy-vuln-app` to drill down on the image scan results.

![Scan Summary](secure-image-scanning-policies-and-assignments/assets/scanning05.png)

You'll notice the information is split into three categories
- Scan Policy (including 'Summary')
- Vulnerabilities
- Content

![Scan Results](secure-image-scanning-policies-and-assignments/assets/ScanResultsUI.png)

Clicking on 'Summary' you'll see the container has quite a few vulnerabilities, one of which (*exposed ports*) is a high priority and will force the container to stop.

![Scan Results](secure-image-scanning-policies-and-assignments/assets/scanning08.1.png)

Clicking on this line you will see the port in question is `TCP/22`.

Under *Vulnerabilities* we can drill down and view the specific vulnerabilities relating to the Operating System, as well as 3rd party packages (Python, pycrypto, numpy).

![Operating System Vulnerabilities](secure-image-scanning-policies-and-assignments/assets/scanning09.png)

![3rd Party Packages Vulnerabilities](secure-image-scanning-policies-and-assignments/assets/scanning10.png)

Under the *Content* heading you will find details on every package installed on the image, along with its version number.  
