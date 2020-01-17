K8s PSP allows you to secure your cluster using admission controllers. This tool evaluates every pod manifest against a policy before running it, and your pod will fail to be launched if requirements are not met. You can define important aspects of the policy, as… The interesting part comes when you have to define them from scratch. Copy-pasting from previous policies has risks, because every application has special needs.

You don’t need PSP Advisor to secure your cluster with PSPs, but it makes the task a lot easier (also, as you’ll see on the last step, you don’t need PSPs activated in your cluster to use Sysdig PSP Advice tools!). Sysdig PSP Advisor automatically can help you in two ways:

 - Generation. It builds PSPs for your deployment by reading the pod specs from kube-audit. That means that you do not have to take care about the permission requirements of your application. It’s based on the [principle of least privilege](https://en.wikipedia.org/wiki/Principle_of_least_privilege). So it will just fit.

 - Simulation. It also allows you to dry-run a given policy in your cluster, hence avoiding running into problems created by a bad policy definition (deployments not restarting). This way you can be sure that every policy is going to work out of the box in your production cluster. 
