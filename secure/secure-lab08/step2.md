We will install the Sysdig Agent using Helm, a package manager for Kubernetes, which is already installed and initialized.

We can view the current status of our cluster using the command  
`kubectl get pod -n kube-system`

Once all the pods are running, we can deploy the Sysdig Agent in a few seconds, as it only takes a simple command:

`helm install --name sysdig --set sysdig.accessKey=YOUR_OWN_ACCESS_KEY,sysdig.settings.tags="cluster:training,location:europe" stable/sysdig`

After copying the above command, you can paste it into the terminal using the right button of your mouse.  Remember you have to use **your own access key**.

This will result in a Sysdig Agent Pod being deployed to each node, and thus the ability to monitor any running containers.

You can see that the sysdig agent has been deployed:  
`helm list`

Creating the containers may take a little time. Check that all the containers are in `Running` state with  
`kubectl get pods`
