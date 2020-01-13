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
Pulling image -- nginx
Using default tag: latest
latest: Pulling from library/nginx
Digest: sha256:8aa7f6a9585d908a63e5e418dc5d14ae7467d2e36e1ab4f0d8f9d059a3d071ce
Status: Image is up to date for nginx:latest

Using local image for scanning -- docker.io/anchore/inline-scan:v0.5.0
Scan Report -
[
  {
    "sha256:89a42c3ba15f09a3fbe39856bddacdf9e94cd03df7403cad4fc105088e268fc9": {
      "docker.io/nginx:latest": [
        {
          "detail": {},
          "last_evaluation": "2020-01-13T13:24:22Z",
          "policyId": "default",
          "status": "pass"
        }
      ]
    }
  }
]

Status is pass
```

You will notice this scan used the `policyId: default`.

<<I'M NOT SEEING THIS IN THE UI. IS IT SUPPOSED TO GET POSTED BACK?

Now let's view a failing scan. For this we will use the container `learnsysdig/dummy-vuln-app` we seen earlier.

<!-- ```
docker pull learnsysdig/dummy-vuln-app
Using default tag: latest
latest: Pulling from learnsysdig/dummy-vuln-app
092586df9206: Pull complete
aafadb0ad2ef: Pull complete
a1ebd97ab158: Pull complete
11971e5302ab: Pull complete
Digest: sha256:6cc44ba161425a205443aba8439052d1d25d6073e24d13efdc2b54a2b3bbb835
Status: Downloaded newer image for learnsysdig/dummy-vuln-app:latest
```

Once downloaded, invoke the scan -->

```
master $ ./inline_scan.sh analyze -s https://secure.sysdig.com -k $APIKEY -P learnsysdig/dummy-vuln-app
Pulling image -- learnsysdig/dummy-vuln-app
Using default tag: latest
latest: Pulling from learnsysdig/dummy-vuln-app
Digest: sha256:6cc44ba161425a205443aba8439052d1d25d6073e24d13efdc2b54a2b3bbb835
Status: Image is up to date for learnsysdig/dummy-vuln-app:latest

Using local image for scanning -- docker.io/anchore/inline-scan:v0.5.0
Scan Report -
[
  {
    "sha256:6cc44ba161425a205443aba8439052d1d25d6073e24d13efdc2b54a2b3bbb835": {
      "docker.io/learnsysdig/dummy-vuln-app:latest": [
        {
          "detail": {},
          "last_evaluation": "2020-01-13T13:39:14Z",
          "policyId": "default",
          "status": "fail"
        }
      ]
    }
  }
]

Status is fail
```

*Note* If the container version metadata is omitted, then it will assume `:latest`.




____
<<>>
In order to run inline scans you must use the Sysdig CLI.

<< Cant get inline scanning working
https://docs.sysdig.com/en/sysdig-cli-for-sysdig-monitor-and-secure.html


inline_scan.sh analyze -s <SYSDIG_REMOTE_URL> -k <API Token> [ OPTIONS ] <FULL_IMAGE_TAG>

https://docs.sysdig.com/en/image-scanning.html
