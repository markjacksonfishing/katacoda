As the cluster operator you get a notification: a service version update is scheduled for today.

Let's simulate that update now, running in your home directory:

`./update.sh`{{execute}}

You can check that the old `result` pods were terminated, and new updated pods were created:

`kubectl get pods -n lab2-example-voting-app`{{execute}}

They are in `Running` state, so the pod initialization process seems fine so far.

However, in the MySQL/PostgreSQL dashboard there is a significant bump in the number of SQL errors that clearly started when we updated the service pods (**yellow rectangle events**). There is something wrong with this new version!
