Before we can define PSP policies, we need to enable PSP in the cluster. To do so, edit the file `kube-apiserver.yaml`{{open}} .


Change line 18...

```
- --enable-admission-plugins=NodeRestriction
```

into this:

```
- --enable-admission-plugins=NodeRestriction,PodSecurityPolicy
```

Now PSP is enabled, but there are no policies to check it against. If we execute:

```
kubectl -n psp-example --as=system:serviceaccount:psp-example:fake-user create -f- <<EOF
apiVersion: v1
kind: Pod
metadata:
  name:      privileged02
spec:
  containers:
    - name:  pause
      image: k8s.gcr.io/pause
      securityContext:
        privileged: true
EOF
```{{execute}}

It will fail and will inform us about no PSP definition found.

At this point we need to define a PSP. Be aware that there's no generic policy that can be applied to every cluster, each pod/application has unique needs. So, if we define them by hand or we use the same policy for all our applications, our policy could be either too restrictive or too loose.

For this example, we will define a PSP policy explicitly blocking privileged containers.

Create a file `example-psp.yaml` (you can use `touch example-psp.yaml`{{execute}}) with this content:

`example-psp.yaml`{{open}}

```
apiVersion: policy/v1beta1
kind: PodSecurityPolicy
metadata:
  name: example
spec:
  privileged: false
  seLinux:
    rule: RunAsAny
  supplementalGroups:
    rule: RunAsAny
  runAsUser:
    rule: RunAsAny
  fsGroup:
    rule: RunAsAny
  volumes:
  - '*'
```{{copy}}

And let's apply it with:

```
kubectl -n psp-example create -f example-psp.yaml
```{{execute}}

Now we have enabled PSP on our cluster and also have a PSP defined. We'll test it in the next step.
