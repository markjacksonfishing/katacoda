First, let's return to the previous version (before the SQL error) just executing:

`./create.sh`{{execute}}

You will need an alert that automatically triggers if the HTTP or SQL golden signals for your application experience a permanent degradation.

For this lab, we will add an alert called `[APM] SQL error threshold`, on metric `net.sql.error.count`.  If the number of SQL errors in our `lab2-example-voting-app` namespace is too high, our alert will be triggered, and it will activate Sysdig Capture.  This capture file will contain a complete trace, down to the Linux system call level of detail, for every pod and process in your application.

Let's update the application again and wait for the alert & capture to be triggered:

`./update.sh`{{execute}}

If you go now to the `Explore` tab and select the `lab2-example-voting-app` namespace and `net.sql.error.count` metric.

You can see how the SQL errors quickly pick up and how this is unequivocally related to the Kubernetes deployment event (yellow rectangle).

A few minutes later, the alert will be triggered and our Sysdig capture will be ready in the `Captures` left tab.  We can open it with Sysdig Inspect, which is an interface built specifically for container troubleshooting, inspired by popular debugging tools like Wireshark.
