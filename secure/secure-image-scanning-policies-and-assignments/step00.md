The Image scanning feature of Sysdig Secure allows you to scan container images, both for known vulnerabilities (for example in os packages and 3rd party libraries) as well as configuration validation.   Configuration validation may include Dockerfile instructions, image contents, attributes, files perms, hashes, secrets, license violations etc.

Scans can be invoked at a number of points in the container lifecycle
 - As part of a CI/CD pipeline during container development
 - Against running containers in production or sandbox environments
 - In a registry

The analysis generates a detailed report of the image contents, including:
 - Official OS packages
 - Unofficial OS packages
 - Configuration files
 - Credentials files
 - Localization modules and software-specific installers:
    - Javascript with NPM
    - Python PiP
    - Ruby with GEM
    - Java/JVM with .jar archives
 - Image metadata and configuration attributes

![Scanning Images](/sysdig/courses/secure/secure-image-scanning-policies-and-assignments/assets/scanning01.png)

By scanning images within the context of a CI/CD pipeline you help to enforce security best practices and ensures no images with known vulnerabilities or misconfigurations make it into production.

Further, periodically scanning a container registry can help ensure any zero day vulnerabilities can be caught.

Sysdig Secure continuously checks against a wide range of vulnerability databases, updating the Runtime scan results with any newly detected CVEs.

For a list of vulnerability databases see [here](https://docs.sysdig.com/en/image-scanning.html)
