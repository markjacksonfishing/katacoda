Conclusions
---

During this lab we have seen how Sysdig Secure can help you generating and simulating your PSPs.

While the consecuences of appliying a PSP to a production cluster could be problematic, Sysdig PSP Advisor provides a dry-run environment to avoid it. With this tool you can have the optimal PSP for your cluster before putting it into production. As easy as droping your deployment file into Sysdig Secure.

One of the complex parts about managing Kubernetes PSP is that is an all or nothing switch. Once you enable PSP functionallity on your cluster, it will affect all the namespaces in it (including those not having a defined PSP for them). The general practice to avoid problems with this is defining a default PSP with high running requeriments, but it will stop any pod from running if it do not comply with the policy. Having a tool that generate PSP for every deployment in an easy-fast way, there's no excuse.

For the shake of simplicity, we haven't included here the scoping functionallity on Sysdig PSP Advisor. For every PSP we want to simulate, we can choose against which namespace we wnat it to run. By default, it will be tested against the whole cluster. 

We hope you have enjoyed this course! You can give us feedback at: training@sysdig.com