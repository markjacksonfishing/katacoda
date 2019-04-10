We will install the Sysdig Agent using Helm, a package manager for Kubernetes. We can download and install Helm with these commands:

`curl -Lo /tmp/helm-linux-amd64.tar.gz https://storage.googleapis.com/kubernetes-helm/helm-v2.13.1-linux-amd64.tar.gz
tar zxf /tmp/helm-linux-amd64.tar.gz -C /tmp/
chmod a+x /tmp/linux-amd64/helm
sudo mv /tmp/linux-amd64/helm /usr/local/bin
kubectl create -f helm-account.yaml
helm init --service-account tiller
helm repo update`{{execute}}

We have also initialized Helm and installed Tiller (the Helm server side component), and made sure our chart database is up-to-date. To learn more about Helm, please visit [WordPress in Kubernetes: The Perfect Setup](https://sysdig.com/blog/wordpress-kubernetes-perfect-setup/) on our blog.

We can view the current status of our cluster using the command `kubectl get pod -n kube-system`{{execute}}

Once the tiller pod is running, we can deploy the Sysdig Agent in a few seconds, as it only takes a simple command:
`helm install --name sysdig --set sysdig.accessKey=YOUR_OWN_ACCESS_KEY,sysdig.settings.tags="cloud:katacoda,cluster:training" stable/sysdig`{{copy}}

(After copying the command, you can paste it into the terminal using the right button of your mouse).

This will result in a Sysdig Agent Pod being deployed to each node, and thus the ability to monitor any running containers.

Creating the containers may take a little time. Check that all the containers are running with
`kubectl get pods`{{execute}}

`helm list`{{execute}} will also show that the sysdig agent has been deployed.
