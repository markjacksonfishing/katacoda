There are multiple ways to install the sysdig-agent. One of our favourites is using Helm Charts. You can review our [documentation](https://docs.sysdig.com/en/agent-installation.html) or [katacoda scenarios](www.academy.sysdig.com) to learn more about other installation methods.  

First, let’s install and update Helm and create a new namespace for the agent. And create a namespace for the agent.

```
curl -fsSL https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
helm version
helm repo add stable https://kubernetes-charts.storage.googleapis.com
helm repo update
kubectl create ns sysdig-agent
```{{execute}}

You can install the `sysdig-agent` using Helm. Remember to update the accessKey (you can find it on Sysdig configuration > Agent-key) and any tag you want to include to identify it.

```
helm install training \
    --set sysdig.accessKey=FAKECAKEacceskeyInsertYoursHereFAKECAKE \
    --set sysdig.settings.tags="role:training\,location:universe" \
    --set auditLog.dynamicBackend.enabled=true \
    --set auditLog.enabled=true \
    --namespace sysdig-agent \
    stable/sysdig
```{{execute}}

It is as easy as that - you’ll now have the agent working in your cluster with Dynamic Auditing configured. It could take a few minutes to start running - in the meantime you can check at your Sysdig Dashboard that you can observe your cluster.
