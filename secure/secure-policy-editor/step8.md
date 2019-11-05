
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
mkdir policy-test
root@node01:/# command terminated with exit code 137
master $
```

You will notice immediately that the container stops (as expected from our Policy actions).  You may also receive an email (if configured)

![Event Notification Email](/sysdig/courses/secure/secure-policy-editor/assets/image13.png)

Go back to Sysdig Secure UI and click on Policy Event

![View Policy Events](/sysdig/courses/secure/secure-policy-editor/assets/image10.png)

You'll notice that our activity has raised a few Policy Events, one of which is the 'Directory Created on container' policy we created earlier.

Highlight this policy and you will see more context, like the node name, container name, scope, actions, and a summary. Note that the summary conforms to the 'output' defined in our Falco code.

![View Policy Event Details](/sysdig/courses/secure/secure-policy-editor/assets/image11.png)

If you chose to create captures when the policy was invoked, then you would see them here. In any case you cam click 'VIEW COMMANDS' to verify the command you executed on the container.

![View Commands](/sysdig/courses/secure/secure-policy-editor/assets/image12.png)
