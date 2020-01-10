<!-- Inline scanning https://github.com/sysdiglabs/secure-inline-scan -->

In the preceding example the scan was initiated from the Web UI - this could also have been initiated by tools like Jenkins as part of CI/CD pipeline. In  either case the image is pulled down from the associated repository to the Sysdig backed to be scanned.

In some circumstances this approach may not be appropriate or possible, for example for privacy or security reasons.

As an alternative you can scan the image on the local node and post the results back to the Sysdig backend.

In order to run inline scans you must use the Sysdig CLI.

<< Cant get inline scanning working
https://docs.sysdig.com/en/sysdig-cli-for-sysdig-monitor-and-secure.html

```
APIToken="fake-e0ed-4d39-95cd-ddd88882fake"
ACCESSKEY="fake3f-cdbc-4d41-b714-f3f5bfake"

docker run -entrypoint sh -it -e SDC_MONITOR_TOKEN=$ACCESSKEY -e SDC_SECURE_TOKEN=$ACCESSKEY sysdig/sdc-cli:0.1.5Dev

docker run -it -e SDC_MONITOR_TOKEN=$ACCESSKEY -e SDC_SECURE_TOKEN=$ACCESSKEY sysdig/sdc-cli:0.1.5Dev sh

docker run -it -e SDC_MONITOR_TOKEN=$ACCESSKEY -e SDC_SECURE_TOKEN=$ACCESSKEY sysdig/sdc-cli:0.1.5Dev /bin/bash


docker run -it -e SDC_MONITOR_TOKEN=$ACCESSKEY -e SDC_SECURE_TOKEN=$ACCESSKEY sysdig/sdc-cli:0.1.5Dev sdc-cli scanning runtime list
```
