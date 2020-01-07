Useful cases: No root user execution
------------------------------------

When not needed, it's a good practice to run services in the containers with specific users, with no privileges.

Let's edit again `example-psp.yaml`{{open}}. Now we will change the rule that follows under `runAsUser`.

```yaml
  runAsUser:
    rule: 'MustRunAsNonRoot'
```

Now, re-apply the policy with:

```
kubectl -n psp-example apply -f example-psp.yaml
```{{execute}}

If we create a container that runs a service as root, it will fail:

```
kubectl -n psp-example --as=system:serviceaccount:psp-example:fake-user create -f- <<EOF
apiVersion: v1
kind: Pod
metadata:
  name:      root01
spec:
  containers:
    - name:  pause
      image: k8s.gcr.io/pause
      securityContext:
        runAsUser: 0
EOF
```{{execute}}

**Note**: The default id value for the root user is `0`.

Thus, we will get the following error:

```
Error from server (Forbidden): error when creating "STDIN": pods "root01" is forbidden: unable to validate against any pod securitypolicy: [spec.containers[0].securityContext.runAsUser: Invalid value: 0: running with the root UID is forbidden]
```

This is the expected behavior, as this new container violated the policy of no root services.