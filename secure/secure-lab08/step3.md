Log into Sysdig Secure and go to the `Policies` section.

Sysdig Secure ships with hundreds of default policies built around the Falco Open Source project.
These policies come from our threat research team, the Center for Internet Security (CIS) best practices, etc.

There are over 60 areas you may want to control within your container environment that are looked for out of the box,
including if someone modifies a binary directory (whether in the host or in a container),
if there is a file opened by a privileged container, and many others.

![Default policies](/sysdig/courses/secure/secure-lab08/assets/default_policies.png)

Sysdig Secure also allows you to customize the existing policies, or create a new one by clicking on `Add policy`.
You could whitelist or blacklist certain processes in an image or a host, define which images are trusted,
limit a deployment or image to have only inbound or outbound connections, whitelist/blacklist ports,
the read/write activity...

![Add policy](/sysdig/courses/secure/secure-lab08/assets/add_policy.png)

You can also leverage the Falco rule syntax and pull in any of the different
[default Falco rules](https://github.com/falcosecurity/falco/blob/dev/rules/k8s_audit_rules.yaml).

Once you have decided what you want to detect, Sysdig can also give you the ability to take action.
For example when an certain event occurs, a container could be stopped or paused.

Using the search box, look for the `Terminal shell in container` policy.
One of the posible actions it to start a Sysdig capture, which would dump all the activity before, during, and after any event.
Customize the policy and specify to collect 30 seconds before the event until 20 seconds after it -
this will give you full visibility into everything that occurred within that window.
Remember to click `Apply changes`.

![Shell in container policy](/sysdig/courses/secure/secure-lab08/assets/shell_in_container_policy.png)

This is really important from a Kubernetes perspective because you have no control over
whether or not that pod is still running.  By the time someone from the Security team looks into that incident,
that container may be long gone.
