Before we start we need a system to work on linked to your Sysdig account. We have set up a Kubernetes cluster just for you.

On the right you can see the terminal of the `master` node, from which you can interact with the cluster using the `kubectl` tool, which is already configured.

For instance, you can get the details of the cluster by executing  
`kubectl cluster-info`{{execute}}

You can view the nodes in the cluster with the command  
`kubectl get nodes`{{execute}}

You should see 2 nodes: one master and a worker.

Check that you are admin:  
`kubectl auth can-i create node`{{execute}}

In order to follow this course, you will need a [Sysdig](http://sysdig.com/) Secure account, with Administrator access privileges.

If you do not have a Sysdig Account, then you can sign up for a 30 day trial here https://sysdig.com/training-trial-signup/.  You will receive an email with a link guiding you through the setup process.

The first time you log into an account you will be greeted by the initial setup wizard. This will walk you through installing your first agents.

![Welcome](/sysdig/courses/secure/secure-policy-editor/assets/02_welcome.png)

Click 'Next' and select the  ‘Kubernetes | GKE | OpenShift’ method button.

![Install](/sysdig/courses/secure/secure-policy-editor/assets/03_install.png)

If you have an existing account, then log in to the web UI, go to your profile Settings, and in the `Agent Installation` tab you will find your Access Key (something like `5ca1ab1e-d3ad-beef-dea1-deba7ab1ed0c`).  Keep it handy, as you will need it to authorize the agent against the backend.

![Agent key](/sysdig/courses/secure/secure-policy-editor/assets/image00.png)

*Note:* There is a similar formatted token called 'Sysdig Secure API Token' on the 'User Profile' page which may cause confusion. Be sure to use the correct token in the 'Agent Installation' tab.  




<!--
# The Issue
An inattentive Kubernetes users has leaked credentials as part of a Kubernetes ConfigMap, leaving them vulnerable to eavesdropping by other users or software entities.

## The Fix
Sysdig Secure can detect this event parsing the JSON events and looking for sensitive keywords (password, pass, AWS, token, etc)

The rule contains several macros:
 - Kubernetes resource is a "ConfigMap"
 - The action was to "modify", including "creating"
- the macro "contains_private_credentials" that parses the JSON object to find certain strings

Rule output will tell you exactly who, when and what was created:

```
K8s configmap with private credential (user=system:serviceaccount:kube-audit-configmap-trigger:kube-audit-configmap-trigger-kubectl-trigger verb=create configmap=aws-creds config={"aws-creds":"aws_access_key_id = \"foo\"\naws_s3_access_key_id = \"bar\"\n"})
```

<<Add screenshots to give context>> -->
