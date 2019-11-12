On the right you can see the terminal of the `master` node, from which you can interact with the cluster using the `kubectl` tool, which is already configured.

First of all, set up a namespace and a service account for this example.
`
kubectl create namespace psp-example
kubectl create serviceaccount -n psp-example fake-user
`{{execute}}

Setting up RBAC
---------------

Before we start we need to set a basic Role Based Access Control (RBAC) configuration in order to be able to run our PSP.

Breafly, RBAC is a way of defining the __actions__ that can be performed over a set of defined __resources__ by a set of __users__. They are defined using roles and rolebindings. Normally you would define a file for a role and another for the rolebinding, but here we'll set it quickly with:

`
kubectl create rolebinding -n psp-example fake-editor --clusterrole=edit --serviceaccount=psp-example:fake-user
`{{execute}}

This command creates a rolebinding named _fake-editor_ between the user (service account) named _fake-user_ and a role that binds the action _edit_ with the resource ¿?¿?¿?.
