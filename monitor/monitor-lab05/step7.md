The ticket token generator example microservices application will behave normally in standard conditions, however it is programmed to trigger the 502 HTTP error issue twice a week.

For training purposes you can also trigger the error manually any time you want executing the following script within your home directory:

`./triggererror.sh`{{execute}}

And if you want the application to return to its normal behavior, you can run:

`./stoperror.sh`{{execute}}

For training purposes we have instrumented being able to trigger and stop the 502 HTTP error within an example microservices application, but this was actually a real issue that one of our customers had. The issue was introduced with a new software release and they were able to troubleshoot it using Sysdig.

Proposed exercises
------------------

After triggering the error:

- Has there been any change in your Kubernetes deployments and pods?
- Can you clearly see an increase in your HTTP errors?
- Which code error in particular?
- Are all the pods reporting errors or just some of them?
