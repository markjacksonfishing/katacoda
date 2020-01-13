<!-- Inline scanning https://github.com/sysdiglabs/secure-inline-scan -->

In the preceding examples the scan was initiated from the Web UI. This could also have been initiated by tools like Jenkins as part of CI/CD pipeline. In either case the image is pulled down from the associated repository to the Sysdig backed to be scanned.

In some circumstances this approach may not appropriate or possible, perhaps for privacy or security reasons.

As an alternative you can scan the image on the local node and post the infrastructure metadata back to the Sysdig platform without providing access to the registry.

There are a few prerequisites in order to be able to scan images locally

 - Sysdig Secure and the ability to connect to the Sysdig installation
 - Docker engine
 - Access to DockerHub
 - Bash

In order to invoke an inline scan you must first download the `inline_scan.sh` script.

```
wget https://raw.githubusercontent.com/sysdiglabs/secure-inline-scan/master/inline_scan.sh
chmod +x inline_scan.sh
```

You can get help on using the tools using `./inline_scan.sh help`

```
master $ ./inline_scan.sh help

Sysdig Inline Scanner/Analyzer --

  Wrapper script for performing vulnerability scan or image analysis on local docker images, utilizing the Sysdig inline_scan container.
  For more detailed usage instructions use the -h option after specifying scan or analyze.

    Usage: inline_scan.sh <analyze> [ OPTIONS ]
```

Before using the tool you need to obtain your Sysdig API Token.  Go to `Settings` > `User Profile` and copy the *Sysdig Secure API Token*.

![Sysdig Secure API Token](secure-image-scanning-policies-and-assignments/assets/sysdig_api_token.png)

You might wish to set this as an environment variable

```
APIKEY='FAKE77a9-e0ed-4d39-95cd-ddd88882FAKE'
```

As an example we can scan the local copy of `nginx:1.15.0` image.  Invoke the scan as follows

```
$ ./inline_scan.sh analyze -s https://secure.sysdig.com -k $APIKEY -P nginx

```


____

In order to run inline scans you must use the Sysdig CLI.

<< Cant get inline scanning working
https://docs.sysdig.com/en/sysdig-cli-for-sysdig-monitor-and-secure.html


inline_scan.sh analyze -s <SYSDIG_REMOTE_URL> -k <API Token> [ OPTIONS ] <FULL_IMAGE_TAG>

https://docs.sysdig.com/en/image-scanning.html

```
APIToken="fake-e0ed-4d39-95cd-ddd88882fake"
ACCESSKEY="fake3f-cdbc-4d41-b714-f3f5bfake"

docker run -entrypoint sh -it -e SDC_MONITOR_TOKEN=$ACCESSKEY -e SDC_SECURE_TOKEN=$ACCESSKEY sysdig/sdc-cli:0.1.5Dev

docker run -it -e SDC_MONITOR_TOKEN=$ACCESSKEY -e SDC_SECURE_TOKEN=$ACCESSKEY sysdig/sdc-cli:0.1.5Dev sh

docker run -it -e SDC_MONITOR_TOKEN=$ACCESSKEY -e SDC_SECURE_TOKEN=$ACCESSKEY sysdig/sdc-cli:0.1.5Dev /bin/bash


docker run -it -e SDC_MONITOR_TOKEN=$ACCESSKEY -e SDC_SECURE_TOKEN=$ACCESSKEY sysdig/sdc-cli:0.1.5Dev sdc-cli scanning runtime list
```
