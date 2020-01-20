Some pods will need more permissions than the default (restrictive) ones we have just defined to be operative and healthy. So in this step we are defining a specific policy for them. We’ll assign it to `kube-system` and `sysdig-agent` (this works with the group:nodes binding so we are good here).

```
kubectl apply -f privileged-psp-with-rbac.yaml
kubectl apply -f sysdig-psp-with-rbac.yaml
```{{execute}}

All of the pods defined inside `kube-system` or `sysdig-agent` namespaces will now be allowed into the cluster, and the cluster is also now ready for your application to run. We can now deploy any application securely. To do this we must define the correct PSP at the same time you deploy a new application. We will do this with the help of Sysdig PSP Advisor

*NOTE* Be careful here. Between the last step and this one, if one of the pods dies or goes down for any reason, they are going to be checked against the default policy. And they won’t pass our default - restrictive - requirements, so they won’t be deployed. Bear in mind, PSPs are like a bouncer: if you are already in, you don’t need to care about him. But if you need to get inside, you’ll have to deal with him before going into the party. You can try to stop any of the pods and you’ll see that they don’t come back up again because of not meeting the requirements of the policy.
