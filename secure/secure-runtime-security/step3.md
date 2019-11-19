Log into Sysdig Secure and go to the `Policies > Runtime Policies` section.

![Menu](/sysdig/courses/secure/secure-runtime-security/assets/menu.png)

Sysdig Secure ships with hundreds of default policies built around the Falco Open Source project.
These policies come from our threat research team, the Center for Internet Security (CIS) best practices, etc.

There are over 60 areas you may want to control within your container environment that are looked for out of the box, including if someone modifies a binary directory (whether in the host or in a container),
if there is a file opened by a privileged container, and many others.

![Default policies](/sysdig/courses/secure/secure-runtime-security/assets/default_policies.png)

In this screen you can switch on/off any of the define policies, search among all of them and filter by their criticality level.

Before we continue, it is important to make explicit the distinction between Policies and Rules within Sysdig Secure.

Policies
===
Policies are defined by the set of `rules` they comprise and the `actions` to execute when one or some of the rules are triggered. For example, a policy can have rules to detect "secrets exposed in a container", and take actions like "kill the container" and "notify the dev team". You can also define the `scope` where the policy will be applied (host, container or customized).

Rules
===
In a general way, a rule is any type of activity that an enterprise would want to detect in its environment. They can be defined from various predefined types, but they all share being handled in a white/black-list format. For example, you could define a rule to detect "secrets exposed in a container", as previously exposed.

This types are the following:

![Rule types](/sysdig/courses/secure/secure-runtime-security/assets/rule_types.png)

With Falco you can create rules for all those types. Its powerful nature allows you to define highly tailored rules for your deployment, or even export others from community.

It is important to note the difference between a `policy scope` and a `rule type`. 
- `Rule types`: define behaviour to be detected.
- `Policy scopes`: define the resources of your deployment where the rules apply.

For example, you can define a syscall-rule blacklisting the "open" syscall (rule type) but you just want it to be applied on containers tagged "PROD" (policy scope).

Now will see how to define a new policy. Click on `Add Policy` on the right top of your screen.

![Add policy](/sysdig/courses/secure/secure-runtime-security/assets/add_policy.png)

By default, scope is targeted to "everywhere", but you can adjust it to the resources of your choice.
After this, you can export any of the existent rules from Library or create new rules.

Once you have decided what you want to detect, Sysdig can also give you the ability to take action.
For example when an certain event occurs, a container could be stopped or paused. You can also `Capture` a range of time before and after the event in order to do forensics after its occurence. 

Let's get into practice. Fill in required fields (name, description) and import the rule `Terminal shell in container` to your policy.
One of the possible actions is to start a Sysdig capture, which would dump all the activity before, during, and after any event.
Customize the policy and specify to collect 30 seconds before the event until 20 seconds after it -
this will give you full visibility into everything that occurred within that window. We also selected to be notified in Slack (the channels where you and your team can be notified are easily configured at your Sysdig settings).

Remember to click `Save`.

![Shell in container policy](/sysdig/courses/secure/secure-runtime-security/assets/shell_in_container_policy.png)

NOTE: The `Capture` feature is really important from a Kubernetes perspective because you have no control over
whether or not that pod is still running.  By the time someone from the Security team looks into that incident,
that container may be long gone.
