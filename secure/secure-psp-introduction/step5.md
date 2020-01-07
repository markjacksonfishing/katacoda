Let's try again to create the same privileged container as we did on step two. We'll name it  __privileged02__

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

This time the error indicates that the creation of privileged containers is explicitly forbidden.

`Error from server (Forbidden): error when creating "STDIN": pods "privileged02" is forbidden: unable to validate against any pod security policy: [spec.containers[0].securityContext.privileged: Invalid value: true: Privileged containers are not allowed]`

Our policy is working as we expected. See the final notice on the error: `Privileged containers are not allowed`.

Modifiying an existing PSP and reapplying it
--------------------------------------------

We can enable again privileged containers at our cluster to check that this change of behaviour was produced by the PSP.

Let's edit `example-psp.yaml`{{open}}, and set `privileged: false` to `privileged: true`.

We need to re-apply the policy with:`example-psp.yaml`
`kubectl -n psp-example apply -f example-psp.yaml`{{execute}}

Now if we try again to create a privileged container, we'll see that it succeeds:

```
kubectl -n psp-example --as=system:serviceaccount:psp-example:fake-user create -f- <<EOF
apiVersion: v1
kind: Pod
metadata:
  name:      privileged03
spec:
  containers:
    - name:  pause
      image: k8s.gcr.io/pause
      securityContext:
        privileged: true
EOF
```{{execute}}
```
pod/privileged03 created
```
