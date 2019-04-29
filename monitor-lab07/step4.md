The `create.sh` script will allow you to deploy a Jenkins application with the plugin to integrate with Sysdig Secure image scanning.

`./create.sh`{{execute}}

Use the **Jenkins tab on the right** to access the Jenkins user interface or, alternatively, open this URL in your browser:

<https://[[HOST_SUBDOMAIN]]-31337-[[KATACODA_HOST]].environments.katacoda.com/>

You will see the following:

![Scenario](/sysdig/scenarios/monitor-lab07/assets/image03.png)

Use the administrator token displayed in the output of the terminal to unlock Jenkins.

Close the "Customize Jenkins" window by clicking the top right icon.
You don't need to execute plugin installation in Jenkins, because all the plugins are bundled in the Docker Image, with the correct version and will be installed with the execution of the next script.

![Customize Jenkins window](/sysdig/scenarios/monitor-lab07/assets/image04.png)

You can ignore the warnings in the next window and click the Start using Jenkins button.

![Jenkins is ready window](/sysdig/scenarios/monitor-lab07/assets/image05.png)

You will see the Jenkins front page with a Welcome message.

![Welcome to Jenkins window](/sysdig/scenarios/monitor-lab07/assets/image06.png)
