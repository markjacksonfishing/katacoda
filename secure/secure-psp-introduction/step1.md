What are Pod Security Policies?
-------------------------------
<jf>
This section looks like it has two headings. 'Getting started on PSPs' comes from `index.json` line24 and 'What are Pod Security Policies?' is defined here.

Maybe put 'What are Pod Security Policies?' in `index.json` and remove heading on this page.
</jf>

The PodSecurityPolicy objects define a set of security constraints that a pod must meet in order to be accepted into the system. Pod Security Policies are one classification of Kubernetes Admission Controller.


What Are Admission Controllers?
-------------------------------

An Admission Controller is a plugin that intercepts requests to the Kubernetes API server after the request is authenticated and authorized but before implementation of the request. So essentially once you make a request and have authenticated, the system will ask the admission controller if you are allowed to do what you’re requesting to do.

There are a variety of admission controller in K8s ranging from those to deny `exec` be run on privileged containers to automatically attaching region or zone labels to PersistentVolumes.

**Note:** Once the PSP admission controller is enabled in your cluster, every pod is required to be approved by one PSP, this means that you cannot enable PSP constrainsts for just one particular set of pods. It's a cluster-wide configuration and you will need to design a cluster-wide set of PSPs with the different access levels and permissions.
