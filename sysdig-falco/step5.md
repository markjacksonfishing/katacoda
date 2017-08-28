Containers usually have a defined and non often changing set of mountpoints. If a container tries to mount a host directory or file outside the allowed directory set, either someone trying to breakout the container or a team member giving excesive visibility to the container.

Let's download a new version of the configuration file for this example:

`sudo -s
cd /etc/falco
curl https://raw.githubusercontent.com/katacoda-scenarios/sysdig-scenarios/master/sysdig-falco/assets/falco_rules_step5.yaml -o falco_rules.yaml
`{{execute}}

This is the rule that watches for sensitive mounts inside containers:

```
- rule: Launch Sensitive Mount Container
  desc: >
    Detect the initial process started by a container that has a mount from a sensitive host directory
    (i.e. /proc). Exceptions are made for known trusted images.
  condition: evt.type=execve and proc.vpid=1 and container and sensitive_mount and not trusted_containers
  output: Container with sensitive mount started (user=%user.name command=%proc.cmdline %container.info)
  priority: INFO
  tags: [container, cis]
```

The macro `sensitive_mount` includes the *forbidden* directories. By default it just watches */proc* but in our configuration file we have modified to include */mnt* as well.

```
- macro: sensitive_mount
  condition: (container.mount.dest[/proc*] != "N/A" or container.mount.dest[/mnt*] != "N/A")
```

To apply the new configuration file we will restart the Sysdig Falco container: `docker restart falco`{{execute}}.

Now, you can spawn a new container and try to mount */mnt*:

`
docker run -d -P --name example4 -v /mnt:/tmp/mnt alpine
`{{execute}}

If we look at the log with `tail /var/log/falco_events.log`{{execute}} you will be able to read:

```
13:32:41.070491862: Informational Container with sensitive mount started (user=root command=sh -g daemon off; example4 (id=c46fa3bf0651))
```

The Sysdig Falco notification shows that recognized a sensitive mount.
