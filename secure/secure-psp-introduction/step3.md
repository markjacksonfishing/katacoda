Before we implement PSP, let's verify that we have unlimited access to create resources. We'll test this creating a privileged container named privileged01

```
kubectl -n psp-example --as=system:serviceaccount:psp-example:fake-user create -f- <<EOF
apiVersion: v1
kind: Pod
metadata:
  name:      privileged01
spec:
  containers:
    - name:  pause
      image: k8s.gcr.io/pause
      securityContext:
        privileged: true
EOF
```{{execute}}

The output shows that it worked.
`pod/privileged01 created`

We can also execute
`kubectl get pods -n psp-example`{{execute}}

and see that the order was successful.

```
NAME           READY   STATUS    RESTARTS   AGE
privileged01   1/1     Running   0          1m16s
```

Unlimited access to resource creation may be the source of privilege escalation or other threads to our cluster. Enabling PSPs can help prevent this.
