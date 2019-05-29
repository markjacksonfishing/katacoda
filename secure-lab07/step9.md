You can execute the pipeline going to **Sysdig CICD cronagent** → **Build with parameters**.

![Build with Parameters](/sysdig/scenarios/secure-lab07/assets/image16.png)

Add your image name in the format **`{YourAccountName}/{ImageName}`**

If there is another pipeline being executed, this one will be queued until the other one has finished.

![Pipeline Sysdig CI/CD cronagent](/sysdig/scenarios/secure-lab07/assets/image17.png)

Once you have executed it, you should see the following screen:

![Pipeline Sysdig CI/CD cronagent](/sysdig/scenarios/secure-lab07/assets/image18.png)

This is correct behaviour in the pipeline, even though it says that has failed.

It has failed because the image contains vulnerabilities and exposes the port 22, which is not desired.

You can see the full report if you click in the corresponding build:

![Build history](/sysdig/scenarios/secure-lab07/assets/image19.png)

And then in the Sysdig Secure plugin button:

![Sysdig Secure Report](/sysdig/scenarios/secure-lab07/assets/image20.png)

You will see the reasons why this pipeline has failed, for example as said before, the port 22 must not be exposed from the container image, along with other vulnerabilities and its details:

![Sysdig Secure Policy Evaluation Summary](/sysdig/scenarios/secure-lab07/assets/image21.png)
