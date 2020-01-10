
<!-- Click on this entry to drill down on the scan details.

![Scan Details](secure-image-scanning-policies-and-assignments/assets/scanning05.png) -->
Results of completed scans can be obtained by clicking `Image Scanning` > `Scan Results`.

To scan an image from the configured repository, click `Scan Image`, and enter the following container name

```
learnsysdig/dummy-vuln-app
```

![Scan Image](secure-image-scanning-policies-and-assignments/assets/scanning06.png)

As the name suggests, this container has known vulnerabilities and is designed to fail for illustrative purposes

You will notice the scan is in progress

![Scan Image](secure-image-scanning-policies-and-assignments/assets/scanning07.png)

It will take a few minutes for the scan to complete.  Once complete, browse to `Image Scanning` > `Scan Result`.

# Understanding Scan Results

To the left of the screen you can see the results are split into three categories
- Scan Policy (and Summary)
- Vulnerabilities discover
- OS and 3rd Party libraries found

![Scan Results](secure-image-scanning-policies-and-assignments/assets/ScanResultsUI.png)

Clicking on 'Summary' you'll see this particular container has quite a few vulnerabilities, one of which is a high priority and will force the container to stop, i.e. an exposed port.  

![Scan Results](secure-image-scanning-policies-and-assignments/assets/scanning08.1.png)

Clicking on this line you will see the port in question is `TCP/22`.

We can drill down and view the specific vulnerabilities relating to the Operating System, as well as 3rd party packages (Python, pycrypto, numpy)  

![Operating System Vulnerabilities](secure-image-scanning-policies-and-assignments/assets/scanning09.png)

![3rd Party Packages Vulnerabilities](secure-image-scanning-policies-and-assignments/assets/scanning10.png)

Under the 'Content' heading you will find details on every package installed on the image, along with its version number.  
