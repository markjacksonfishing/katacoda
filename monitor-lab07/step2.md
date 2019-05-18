The pipelines will be executed in the following order:

1. Jenkins will download the source code of the project.
2. Using the source code, builds the Docker image.
3. Pushes the docker image to DockerHub.
4. Triggers the execution of the Sysdig Plugin.
5. Under the hood, Sysdig executes Anchore using Sysdig image profiles.
6. Anchore executes the scan and generates a report.

![Scenario](/sysdig/scenarios/monitor-lab07/assets/image02.png)