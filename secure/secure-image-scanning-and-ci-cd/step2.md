The pipelines will be executed in the following order:

1. Jenkins will download the source code of the project.
2. Using the source code, builds the Docker image.
3. Pushes the docker image to DockerHub.
4. Triggers the execution of the Sysdig Plugin.
5. Sysdig executes the scan and generates a report.

![Scenario](/sysdig/courses/secure/secure-image-scanning-and-ci-cd/assets/image02a.png)
