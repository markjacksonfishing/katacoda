Let's now play the sysadmin role, and investigate the incident.
In the `Policy Events` pane of Sysdig Secure we can notice that someone spawned a terminal shell in a container.  Clicking on it you can find more details about the event, including all the Kubernetes labels.

![Shell event](/sysdig/courses/secure/secure-lab08/assets/shell_event.png)

To look at what commands were executed, click on the `View commands` button.

![Commands Audit](/sysdig/courses/secure/secure-lab08/assets/commands_audit.png)

On the left sidebar you can click `Captures`, and you will find the capture for this event.  Click on the the shovel icon
to open the scap file for that event with Sysdig Inspect.

![Captures pane](/sysdig/courses/secure/secure-lab08/assets/captures_pane.png)

This is similar to the workflow you would do with a pcap file in Wireshark, but this is a scap file and the program is Sysdig Inspector.
The first thing you would want to do is to set context. You can click on the `Sysdig Secure Notifications` tile under `General` to see
when the event occurred at the bottom of the screen.  Then you can click some of the tiles to overlay file activity,
network activity and the executed commands.
The capture has everything that happened 30 seconds before the event until 20 seconds after it. Using the sliders you can isolate just the data that is relevant for your investigation.  In this example we have 14500 system calls and 4 executed commands
in a 752 ms window.

![Sliders](/sysdig/courses/secure/secure-lab08/assets/sliders.png)

You can click on a tile to drill down to see for example the executed commands.

![Commands in a time window](/sysdig/courses/secure/secure-lab08/assets/window_commands.png)

You can go a layer further: double click on the `tar` process, and then switch to `Directories` in the menu on the left to
explore the directories and files that were created when the archive was extracted.

![Exploring directories](/sysdig/courses/secure/secure-lab08/assets/exploring_directories.png)

You can even see the contents of any individual file by clicking on its `I/O streams` icon (the second icon at the left of the row).

![File contents](/sysdig/courses/secure/secure-lab08/assets/file_contents.png)
