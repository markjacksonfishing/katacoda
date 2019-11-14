


Before you install the Sysdig Agent you will need to get your Access Key from the previous step, e.g. `5ca1ab1e-d3ad-beef-dea1-deba7ab1ed0c`

`cd` into the `manifests` directory

```
$ cd manifests
```

Now run the script `sysdig-agent.sh`, and enter your Access Key when prompted

```
$ ./sysdig-agent.sh
Please enter your Access Key :
5ca1ab1e-d3ad-beef-dea1-deba7ab1ed0c
namespace/sysdig-agent created
secret/sysdig-agent created
clusterrole.rbac.authorization.k8s.io/sysdig-agent created
serviceaccount/sysdig-agent created
clusterrolebinding.rbac.authorization.k8s.io/sysdig-agent created
configmap/sysdig-agent created
daemonset.apps/sysdig-agent created
```

Now wait until your pod is up and running before continuing

```
master $ kubectl get pods -n sysdig-agent
NAME                 READY   STATUS    RESTARTS   AGE
sysdig-agent-c9s7s   1/1     Running   0          1m22s
sysdig-agent-h2g6r   1/1     Running   0          1m22s
```
