Let's now play the sysadmin role, and investigate the incident.
In the `Policy Events` pane of Sysdig Secure we can notice that someone spawned a terminal shell in a container.  Clicking on it you can find more details about the event, including all the Kubernetes labels.

![Shell event](/sysdig/courses/secure/secure-runtime-security/assets/shell_event.png)

Activity Audit
--------------

To look at what commands were executed, click on the `Activity Audit` button. Here you'll be able to see in a cronological view the set of commands that we executed on the machine. You can learn more about `Audit Forensics` in an [specific classroom](https://academy.sysdig.com/series/sysdig-secure/activity-audit).

![Commands Audit](/sysdig/courses/secure/secure-runtime-security/assets/commands_audit.png)

Captures
--------

On the left sidebar you can click `Captures` (or from `View Captures` on the Policy Event Details), and you will find the capture for this event. Click on the the shovel icon to open the scap file for that event with Sysdig Inspect. It will open a new window on your browser.

![Captures pane](/sysdig/courses/secure/secure-runtime-security/assets/captures_pane.png)

Sysdig Inspect
--------------

This is similar to the workflow you would do with a pcap file in Wireshark, but this is a scap file and the program is Sysdig Inspector.

The first thing you would want to do is to set context. Click on:
- `Sysdig Secure Notifications` tile under `General`
- `Modified Files` under `File`
- `Net Bytes In` under `Network`
- and `Executed Commands` in the `Security` 

With all of them we'll see at the bottom column  all the overlayed file activity, network activity and the executed commands.

The capture has everything that happened 30 seconds before the event until 20 seconds after it.
You should see spikes in the graph, a bit after the event, when the commands were executed.

Using the sliders in the graph you can isolate just the data that is relevant for your investigation.
In this example we have 14500 system calls and 4 executed commands in a 752 ms window.

![Sliders](/sysdig/courses/secure/secure-runtime-security/assets/sliders.png)

If you hover over the `Executed Commands` tile you will see two down-looking arrows,
which you can click to drill down and see the commands executed during the time window
selected with the sliders.

![Commands in a time window](/sysdig/courses/secure/secure-runtime-security/assets/window_commands.png)

You can go a layer further: double click on the `tar` process, and then switch to `Directories` in the menu on the left to
explore the directories and files that were created when the archive was extracted.

![Exploring directories](/sysdig/courses/secure/secure-runtime-security/assets/exploring_directories.png)

You can even see the contents of any individual file by clicking on its `I/O streams` icon (the second icon at the left of the row).

![File contents](/sysdig/courses/secure/secure-runtime-security/assets/file_contents.png)
