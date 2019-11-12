What are Pod Security Policies?
-------------------------------
The PodSecurityPolicy objects define a set of security constraints that a pod must meet in order to be accepted into the system. Pod Security Policies are one classification of Kubernetes Admission Controller.

What Are Admission Controllers?
-------------------------------
An Admission Controller is a plugin that intercepts requests to the Kubernetes API server after the request is authenticated and authorized but before implementation of the request.  So essentially once you make a request and have authenticated, the system will ask the admission controller if you are allowed to do what you’re requesting to do.

There are a variety of admission controller in K8s ranging from those to deny `exec` be run on privileged containers to automatically attaching region or zone labels to PersistentVolumes.
