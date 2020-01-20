First, let’s create a default restrictive PSP for your default service account. 
If you check out the file `default-psp-with-rbac.yaml` you’ll notice that the only option allowed is `readOnlyRootFilesystem=false`. If we assign a true value to this option, no process would be able to write on filesystem. As there is no application that in practice is prepared for this (all of them normally need to write something there at some point), it is better to make it false. 
So, by default, our policy is going to be the most restrictive policy possible. It will be applied to every deployment for which we haven’t defined a policy. You’ll also see that the file includes a role and a role binding along with the PodSecurityPolicy definition. 

Run the following command to apply the role binding and PSP, run the following command:

```
kubectl apply -f default-psp-with-rbac.yaml
```{{execute}}

Your PSP is now enabled. The next command will list all PSPs in your cluster - just one at the moment - and some general information about them. You can check that it is working with:
```
kubectl get psp
```{{execute}}
