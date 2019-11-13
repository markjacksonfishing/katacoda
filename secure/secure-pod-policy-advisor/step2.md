
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
`
helm install --name sysdig-agent-katacoda \
    --set sysdig.accessKey=f9de92a3-1ad2-4a47-8689-e5bb6c1a2ba7 \
    --set sysdig.settings.collector=ec2-54-85-248-70.compute-1.amazonaws.com \
    --set sysdig.settings.collector_port=6443 \
    --set sysdig.settings.ssl_verify_certificate=false \
    --set sysdig.settings.ssl=true \
    stable/sysdig
    --set sysdig.settings.tags="cluster:training,location:universe"
`{{execute}}

After copying the command, you can paste it into the terminal using the right button of your mouse.  Remember you have to use **your own access key**.

This will result in a Sysdig Agent Pod being deployed to each node, and thus the ability to monitor any running containers.

You can see that the sysdig agent has been deployed:

`helm list`{{execute}}

Creating the containers may take a little time. Check that all the containers are in `Running` state with

`kubectl get pods -w`{{execute}}

Creating the containers may take a little time. Check that all pods have STATUS 'Running' and READY '1/1' before continuing. Once on desided state, press Ctrl+C to stop the watch.
