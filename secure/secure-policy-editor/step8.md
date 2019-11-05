# Test our Policy

To test our new Policy and the rule, we will create a pod with a single `nginx` container. We will then compromise the container and manually create a directory to invoke our policy rule.  If the rule succeeds, then the container should get paused, and I should receive an email.

<!--https://kubernetes.io/docs/tasks/debug-application-cluster/get-shell-running-container/ -->

Open the terminal tab on the right pane, then create a file called `policy-rule-test.yaml` with the following contents

```YAML
apiVersion: v1
kind: Pod
metadata:
  name: policy-rule-test
spec:
  volumes:
  - name: shared-data
    emptyDir: {}
  containers:
  - name: nginx
    image: nginx
    volumeMounts:
    - name: shared-data
      mountPath: /usr/share/nginx/html
  hostNetwork: true
  dnsPolicy: Default
  ```

This file contains the configuration for our Pod.  Run the following command to create the Pod.

```
kubectl apply -f policy-rule-test.yaml
pod/policy-rule-test created
```

Verify the Pod is Running

```
kubectl get pod policy-rule-test
NAME               READY   STATUS    RESTARTS   AGE
policy-rule-test   1/1     Running   0          19s
```

Now create a shell into the running Container

```
kubectl exec -it policy-rule-test -- /bin/bash
root@node01:/#
```

Create a directory in the container

```
mkdir test
```

You will notice immediately that the container becomes paused (as expected from our rule actions)

Go back to Sysdig Secure UI and click on Policy Event

![View Policy Events](/sysdig/courses/secure/secure-policy-editor/assets/image10.png)

You'll notice that our activity has raised a few Policy Events, one of which is the policy we created earlier.
