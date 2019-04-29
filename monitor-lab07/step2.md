The pipelines will be executed in the following order:

- Jenkins will download the source code of the project.
- Using the source code, builds the Docker image.
- Pushes the docker image to DockerHub.
- Triggers the execution of the Sysdig Plugin.
- Under the hood, Sysdig executes Anchore using Sysdig image profiles.
- Anchore executes the scan and generates a report.

![Scenario](/sysdig/scenarios/monitor-lab07/assets/image02.png)