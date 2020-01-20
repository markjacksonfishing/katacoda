In order to grant access to the *sysdig-agent* to parse cluster-level information (deployment definitions and other events) we need to enable *K8s Audit*. Also, it is a good idea to have it working, as a record of *who did what* on your cluster. There are some steps we need to take in order to prepare the cluster for **Auditing** and **Pod Security Policies**.

First, check that all the pods are prepared and running in the cluster:

```
kubectl get pods -A
```{{execute}}

You should see a set of Kubernetes resources running and no other deployments.

# What is Audit?f
Audit registers chronologically a set of events that have happened on the system, tagged by individual users, administrators or other components of the system. It’s performed by *kube-apiserver* and it’s one of the most useful features concerning security. It can register requests to the Kubernetes API in each of its different stages:
 - **RequestReceived**: events triggered when request has been received and it has been delegated down the handler chain.
 - **ResponseStarted**: the response headers are sent, but not the response body.
 - **ResponseComplete**: response body has been completed.
 - **Panic**: when a panic occurred.

For every event matching a rule, we can define its level of detailed:
 - **None**: not logging at all.
 - **Metadata**: it logs request metadata..
 - **Request**: event metadata + request body.
 - **RequestResponse**: log event metadata + request body + response bodies.

# Audit sink configuration
Before we can use K8s Auditing we must first define an audit-policy. As an example, examine the file <<audit-policy>> to see the different levels of recording for every event:

```
cat audit-policy
```{{execute}}


```
...
  - level: RequestResponse
	resources:
	- group: "" # core API group
  	resources: ["secrets", "configmaps"]
...
```


These lines shown means that this rule will record log event metadata, request and response bodies of all the requests modifying *secrets* or *configmaps* on the cluster.


*Note*. Be careful to adhere to the correct indenting spaces if you edit this file!


Policy documents reside in the directory `/etc/kubernetes/policies`, so let’s create this directory and move the policy file into place:


```
mkdir /etc/kubernetes/policies
mv ./audit-policy.yaml /etc/kubernetes/policies/audit-policy.yaml
```{{execute}}

Now that we have an audit-policy defined, we need to apply it at the cluster.  At the moment (kubernetes 1.18), it is not possible to apply the audit-policy with a `kubectl apply ...` command. We’ll also need to define other options and where to mount the folder with our audit-policy.

Let’s edit the `kube-apiserver.yaml` and include this new definitions:

```
vi /etc/kubernetes/manifests/kube-apiserver.yaml
```{{execute}}

This are the new specs for kube-apiserver definition that you need to include:
```
spec:
  containers:
  - command:
    //other apiserver parameters
    - --audit-policy-file=/etc/kubernetes/policies/audit-policy.yaml
    - --audit-log-path=-
    - --audit-dynamic-configuration=true
    - --feature-gates=DynamicAuditing=true
    - --runtime-config=auditregistration.k8s.io/v1alpha1=true
    (...)
    volumeMounts:
    //existant volumeMounts
    - mountPath: /etc/kubernetes/policies
      name: policies
      readOnly: true
    (...)
  volumes:
  //existant volumes
  - hostPath:
      path: /etc/kubernetes/policies
      type: DirectoryOrCreate
    name: policies
status: {}
```

You do not need to restart the apiserver after making configuration changes - after a few seconds the changes will be applied.

Check that everything is ok. You should be watching the `kube-apiserver` up and running.

```
kubectl get pods -A
```{{execute}}

If its not running, some of the changes/formatting/spacing in the `kube-apiserver.yaml` file may be wrong.

We consider debugging your cluster a good skill, so in the next step we are going to briefly review how to do so. You can skip this if your `kube-apiserver` is running and you already know how to debug it.

## Further steps: debugging the apiserver (optional)

Here, you can try to break it (if you have not already done) and debug misbehavior of such an important k8s component as the *kube-apiserver*.

In this section, we will troubleshoot *kube-apiserver* not starting after the previous configuration change.  However, troubleshooting Kubernetes, and *kube-apiserver* in particular, is a valuable skill, so you may wish to manually break it (as illustrated below), and follow through the steps.

If you didn’t break the *kube-apiserver* after updating the configuration in the previous step, we propose you to

a) modify the `kube-apiserver.yaml` file without including the volume mounting information for the policy, or
b) misspell any of the other parameters of the apiserver, like: `audit-policy-file` to `audit-policy-fooflie`.

Either method will cause it to break. This way, you’ll have an easy starter scenario to learn how to debug it and understand why it is failing.

After breaking, you will notice that you can’t see the `kube-apiserver` with `kubectl get pods`. Here you have two options.

First, you can use docker logs. As the name of the container will be different every time, you need to execute te following command to discover the name of the container running the apiserver

```
docker ps
```{{execute}}


In Katacoda it starts with `k8s_kube-api…`.   Once you have container name, you can view its logs as follows


```
docker logs <container-name>
```

*Note*  A quick way of entering the container name is to use autocompletion, i.e., type the start ot the name and press the *tab* key.

You should see messages in the log output referring to the issue.

Another option is using `kubectl` logs. Remember for every pod you need to specify it’s namespace like this:

```
kubectl logs -n kube-system kube-apiserver-master
```{{execute}}

Again, you can autocomplete to find the specific naming in your cluster.

Do you see any clue about what’s happening (of course you do, you broke it!)?  Fix it and let’s continue with the course.

Also, as we piped the audit to the STDOUT, you’ll be able to see the audit information with logs and errors of the apiserver. For other purposes, you could specify a route in `audit-log-path` configuration setting in `kube-apiserver.yaml` to a file where register all the audit logs.

All the pre-requirements are now done and we can start playing around with PSPs definitions and applications.
