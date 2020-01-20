Conclusions
---


In this scenario we have covered all the required steps you need to take in order to use k8s PSPs capabilities in a production environment. You have learnt how to use Sysdig PSP Advisor to ease this process without compromising its availability and normal functioning, you generating and simulating your PSPs.

While the consecuences of appliying a PSP to a production cluster could be problematic, Sysdig PSP Advisor provides a dry-run environment to avoid it. With this tool you can have the optimal PSP for your cluster before putting it into production. As easy as droping your deployment file into Sysdig Secure.

One of the complex parts about managing Kubernetes PSP is that it is an *all or nothing* switch-case. Once you enable PSP functionallity on your cluster, it will affect all the namespaces in it (including those not having a defined PSP for them). The general practice to avoid problems with this is defining a default PSP with top level restrictions, but it will stop most of the pods from running since they won't probably comply with the policy. Having a tool that generate PSP for every deployment in an easy-fast way, there's no excuse for this to happen.


We hope you have enjoyed this course! At any case, feedback is always welcomed at: [training@sysdig.com](training@sysdig.com).
