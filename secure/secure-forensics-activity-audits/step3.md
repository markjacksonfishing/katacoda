
We will install the Sysdig Agent using **Helm**, a package manager for Kubernetes.

Let's download and uncompress Helm:

`curl -Lo /tmp/helm-linux-amd64.tar.gz https://storage.googleapis.com/kubernetes-helm/helm-v2.13.1-linux-amd64.tar.gz
tar zxf /tmp/helm-linux-amd64.tar.gz -C /tmp/`{{execute}}

We make the binary executable, and place it in the path:

`chmod a+x /tmp/linux-amd64/helm
sudo mv /tmp/linux-amd64/helm /usr/local/bin`{{execute}}

Finally, we also initialize Helm, install Tiller (the Helm server side component), and make sure our chart database is up-to-date:

`kubectl create -f helm-account.yaml
helm init --service-account tiller
helm repo update`{{execute}}

We can view the current status of our cluster using the command `kubectl get pod -n kube-system`{{execute}}

Installing Sysdig Agent
-----------------------

Once the tiller pod is running, we can deploy the Sysdig Agent in a few seconds, as it only takes a simple command:
`helm install --name sysdig --set sysdig.accessKey=YOUR_OWN_ACCESS_KEY,sysdig.settings.tags="cluster:training" stable/sysdig`{{copy}}

After copying the command, you can paste it into the terminal using the right button of your mouse.  Remember you have to use **your own access key**.

This will result in a Sysdig Agent Pod being deployed to each node, and thus the ability to monitor any running containers.

You can see that the sysdig agent has been deployed:

`helm list`{{execute}}

Creating the containers may take a little time. Check that all the containers are in `Running` state with

`kubectl get pods`{{execute}}

Creating the containers may take a little time. Check that all pods have STATUS 'Running' and READY '1/1' before continuing.























<<Set this up as a lab task they perform>>

The rule contains several macros:
 - Kubernetes resource is a "ConfigMap"
 - The action was to "modify", including "creating"
- the macro "contains_private_credentials" that parses the JSON object to find certain strings

Rule output will tell you exactly who, when and what was created:

```
K8s configmap with private credential (user=system:serviceaccount:kube-audit-configmap-trigger:kube-audit-configmap-trigger-kubectl-trigger verb=create configmap=aws-creds config={"aws-creds":"aws_access_key_id = \"foo\"\naws_s3_access_key_id = \"bar\"\n"})
```

<<Add screenshots to give context>>


<<Maybe add another rule to catch `kubectl create -f foo` ?>>
