Jenkins
-------

Jenkins is an automation server that provides a solution for building, deploying and automating any project. With it, one can execute, or program periodic executions of Continuous Integration and Continuous Delivery.

Continuous Integration (CI) is a procedure with which we are building and testing the project as the developers make changes in it.  With this methodology all developers' feature branches are merged into a shared mainline branch several times a day.  This solves the "integration hell" and helps to avoid one developer's work-in-progress breaking another developer's copy.

Continuous Delivery (CD) aims at building, testing, and releasing software with greater speed and frequency. Most of the deployments are repetitive, so automating them increases reliability in the deployment process and avoid wasting time.

Image Scanning
--------------

One of the last steps of the Continuous Integration pipeline involves building the container images that will be pulled and executed in our environment. Therefore, whether you are building Docker images from your own code or when using unmodified third party images, it's important to identify and find any known vulnerabilities that may be present in those images.

Docker images are composed of several immutable layers, basically a diff over the previous one adding files and other changes, and each one associated with a unique hash id.

The container image scanning process typically includes:

- Checking the software packages, binaries, libraries, operating system files, etc. against one or more well known vulnerabilities databases. Some Docker scanning tools have a repository containing the scanning results for common Docker images that can be used as a cache to speed up the process.
- Analyzing the Dockerfile and image metadata to detect security sensitive configurations like running as privileged (root) user, exposing insecure ports, using based images tagged with “latest” rather than specific versions for full traceability, etc.
- User defined policies, or any set of requirements that you want to check for every image, like software packages blacklists, base images whitelists, whether a SUID file has been added, etc.

Anchore
-------

[Anchore Engine](https://anchore.com/) is a third party product that allows developers to perform detailed analysis on their container images, run queries, produce reports and define policies that can be used in CI/CD pipelines. Developers can extend the tool to add new plugins that add new queries, new image analysis, and new policies.

![Anchore](/sysdig/scenarios/secure-lab07/assets/image01.png)
