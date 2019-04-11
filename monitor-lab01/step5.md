In order to handle the increased load we decide to scale up the `vote` service.

Again, in our home directory we have a script to scale this service:

`./scale.sh`{{execute}}

After a few moments, using the Services -> Kubernetes Service Golden Signals dashboard one more time, we can see how our application becomes under control again.