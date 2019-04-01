We have already set up a Kubernetes cluster just for you, so you just have to make sure it is up and running by executing `launch.sh`{{execute HOST1}}

Once Kubernetes is ready, we join node01 to the cluster running the script `join.sh`{{execute HOST2}}.

Then we can run `kubectl get nodes`{{execute HOST1}} on the master to see the nodes in the cluster and check they are ready.

We will install Falco using Helm, a package manager for Kubernetes. We can download and install Helm with these commands:

`
curl -Lo /tmp/helm-linux-amd64.tar.gz https://storage.googleapis.com/kubernetes-helm/helm-v2.13.1-linux-amd64.tar.gz
tar zxf /tmp/helm-linux-amd64.tar.gz -C /tmp/
chmod a+x /tmp/linux-amd64/helm 
sudo mv /tmp/linux-amd64/helm /usr/local/bin
kubectl create -f helm-account.yaml
helm init --service-account tiller
helm repo update
`{{execute HOST1}}

We have also initialized Helm and installed Tiller (the Helm server side component), and made sure our chart database is up-to-date. To learn more about Helm, please visit [WordPress in Kubernetes: The Perfect Setup](https://sysdig.com/blog/wordpress-kubernetes-perfect-setup/) on our blog.

We can view the current status of our cluster using the command `kubectl get pod -n kube-system`{{execute HOST1}}

We can now deploy Sysdig Falco in a few seconds, as it only takes a simple command:
`helm install --name sysdig-falco-1 stable/falco`{{execute HOST1}}

This will result in a Falco Pod being deployed to each node, and thus the ability to monitor any running containers for abnormal behavior.
`kubectl get pods`{{execute HOST1}}
