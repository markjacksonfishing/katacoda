In this scenario we are going to show the advantages of using Sysdig PSP Advisor over the practice of defining and running in production policies not tested before. 

Kubernetes Pod Security Policies (PSP)
---

PSPs provide a framework to ensure that Pods run only with the appropriate privileges and can solely access the pertinent resources. It is one of the most usefull prevention actions to take to protect our cluster but, as we'll see through this steps, doing it manually is not always straight-forward and can have risks.

Although you can perfectly take this course with the contents included in it, we recommend you to take this [scenario about K8s PSP](https://www.katacoda.com/sysdig/courses/secure/secure-psp-introduction) prior taking this one. It explain in a broad way what are Kubernetes PSPs and how to make them work into your cluster.

Least privilege concept. 
---

[**Least privilege**](https://en.wikipedia.org/wiki/Principle_of_least_privilege) is the concept and practice of restricting access rights for users, accounts, and computing processes to only those resources absolutely required to perform routine, legitimate activities. In a K8s PSPs context, it means that the optimal PSPs definition will be that giving our pods just the required permissions. No less and no more! 


What is Sysdig PSP Advisor.
---

Sysdig Secure Kubernetes Policy Advisor assists users in both creating and validating Pod Security Policies before they apply them.

It's two main functions are:

1. Generate from a *deployment.yaml* the least privileged *psp.yaml*.

2. Dry-run a given *psp.yaml* over a given cluster. It outputs the same errors the user would receive if he/she were applying the policie on the cluster. 

Why Sysdig PSP Advisor?
---

Every deployment has its own requirements so there is no generic PSP definition we can apply to all of them indistinctivelly. It has to have the right access, neither more neither less. This tool generates the optimal one for you, just dropping the deployment file into Sysdig Secure.

Also, when simulating your PSP, it will output the same errors as if the PSP would have been applied. And all of this without the negative consecuences it could bring to you doing so: breaking your application because of a PSP too restrictive or, worst, having a security breach for a policy too loose.

Let's see how it works!