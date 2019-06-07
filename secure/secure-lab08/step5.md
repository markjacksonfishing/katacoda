Let's now play the sysadmin role, and investigate the incident.
In the `Policy Events` pane of Sysdig Secure we can notice that someone spawned a terminal shell in a container.  Clicking on it you can find more details about the event, including all the Kubernetes labels.

![Shell event](/sysdig/courses/secure/secure-lab08/assets/shell_event.png)

To look at what commands were executed, click on the `View commands` button.

![Commands Audit](/sysdig/courses/secure/secure-lab08/assets/commands_audit.png)

On the left sidebar you can click `Captures`, and you will find the capture for this event.  Click on the the shovel 
to open the capture for that event with Sysdig Inspect.

![Captures pane](/sysdig/courses/secure/secure-lab08/assets/captures_pane.png)

![Sliders](/sysdig/courses/secure/secure-lab08/assets/sliders.png)
