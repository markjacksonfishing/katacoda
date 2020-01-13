Sysdig Secure requires credentials in order to pull and analyze images from a registry. To see what registries that have been configured in the system, select `Image Scanning` > `Registry Credentials`.

To create a new registry, click `Add Registry`. For the purposes of this training course we will add a preconfigured Docker Repository.  With that in mind, use the following information to complete the form

- Registry/Repository: `learnsysdig`
- Type: `Docker V2`
- Username: `learnsysdig`
- password: `Sysd1g123!`
- Internal Registry Address: n/a
- Allow Self Signed: n/a
- Use Image to Test Credentials: `learnsysdig/nginx:1.17.0`

![Add Registry](secure-image-scanning-policies-and-assignments/assets/addregistry01.png)

Some points to note:
  - There are currently three registry types supported, and each type has unique input fields for the credentials required, i.e.
    - Docker Hub - `username`/`password`
    - AWS Elastic Container Registry (ECR) - `Access Key`/`Secret Key`
    - Google Container Registry - `JSON key`
  - You must supply the name of a container in the registry in the 'Use Image to Test Credentials' field before you can validate the container registry.
  - The recommended way to run an image registry for an OpenShift cluster is to run it locally. The Sysdig agent will detect the internal registry names, but for the Anchore engine to pull and scan the image it needs access to the internal registry itself.
  - *Azure Container Registry* adhere's to the *Docker V2* format, but the username can be identified by the command

    ```
    az acr credentials show --name <registry name>
    ```
    and the password by

    ```
    az acr credentials show
    ```

## Initiating a Scan

Image scans can be initiated and results of completed scans can be viewed from the `Image Scanning` > `Scan Results` screen. Browse to this screen and click `Scan Image` and enter the following container name

```
learnsysdig/dummy-vuln-app
```

![Scan Image](secure-image-scanning-policies-and-assignments/assets/scanning06.png)

As the name suggests, this container has known vulnerabilities and is designed to fail for illustrative purposes. You will notice the scan is in progress

![Scan Image](secure-image-scanning-policies-and-assignments/assets/scanning07.png)

It will take a few minutes for the scan to complete.  
