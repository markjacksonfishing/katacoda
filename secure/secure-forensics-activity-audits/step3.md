


Install Sysdig agent

Before you install the Sysdig Agent you will need to get your Access Key from the previous step, e.g. `5ca1ab1e-d3ad-beef-dea1-deba7ab1ed0c`

Run the following command to base64 encode string

```
$ echo -n 5ca1ab1e-d3ad-beef-dea1-deba7ab1ed0c  | base64
NWNhMWFiMWUtZDNhZC1iZWVmLWRlYTEtZGViYTdhYjFlZDBj
```

Edit the file `sysdig-secret.yaml` and replace the existing key with your base64 encoded key

```
apiVersion: v1
kind: Secret
metadata:
  name: sysdig-agent
  labels:
    app: sysdig-agent
type: Opaque
data:
  access-key: NWNhMWFiMWUtZDNhZC1iZWVmLWRlYTEtZGViYTdhYjFlZDBj
```

Now run the script `sysdig-agent.sh`

```
$ sysdig-agent.sh

```
