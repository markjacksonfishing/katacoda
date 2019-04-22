In order to handle the increased load we decide to scale up the `vote` service.

Again, in our home directory we have a script to scale this service:

`./scale.sh`{{execute}}

After a few moments, using the `Services` → `Kubernetes Service Golden Signals` dashboard one more time, we can see how our application becomes under control again.

![Golden signals](assets/img/image09.png)

We can see a couple of interesting points:

- The response time per service is performing like before the stress peak. The application is responding flawlessly.
- The request rate per service has increased. We receive more requests, and we can fulfill its requirements when the vote service is scaled up.