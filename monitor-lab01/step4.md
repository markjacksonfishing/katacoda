The example voting application will normally behave well in standard conditions, as deployed. But imagine that suddenly our app starts to receive more traffic.

For training purposes we can stress the application manually by executing the following script within the home directory:

`./stress.sh`{{execute}}

This will scale up the instances of `voter` service, generating more load on the application.

After a few moments, you will be able to see a change in the golden signals behavior, for example in the Services -> Kubernetes Service Golden Signals dashboard.