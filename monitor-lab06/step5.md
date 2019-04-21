Set up an alert on the number of restarts of the pods that, when triggered, will produce a Sysdig capture file.

Let's scale the nginx deployment back to 0 pods:

`kubectl scale deployment nginx -n nginx-flask --replicas=0`{{execute}}

We will now use an script included in this folder that will constantly try to spawn the nginx pods several times over 5 minutes:

`./generror.sh`{{execute}}

Leave the script running, it will finish and stop generating the error condition in a few minutes.

There will be a very sudden increase in pod restart events in the `nginx-flask` namespace. In the Captures tab, you should be able to see the corresponding capture file, that will greatly help us discover the cause of the restarts.
