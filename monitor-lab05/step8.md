You will be able to see the event in the event stream:

![Events](assets/image10.png)

If we go back to the Explore tab and explore the `net.http.error.count` metric segmented by `kubernetes.pod.name`:

![net.http.error.count](assets/image11.png)

It seems that the error is coming from the balancer deployment. Now it's time to dig real deep in the process forensics and network communication details, we need to use the Sysdig capture file associated with this event.
