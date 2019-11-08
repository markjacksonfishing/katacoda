<<Set this up as a lab task they perform>>

The rule contains several macros:
 - Kubernetes resource is a "ConfigMap"
 - The action was to "modify", including "creating"
- the macro "contains_private_credentials" that parses the JSON object to find certain strings

Rule output will tell you exactly who, when and what was created:

```
K8s configmap with private credential (user=system:serviceaccount:kube-audit-configmap-trigger:kube-audit-configmap-trigger-kubectl-trigger verb=create configmap=aws-creds config={"aws-creds":"aws_access_key_id = \"foo\"\naws_s3_access_key_id = \"bar\"\n"})
```

<<Add screenshots to give context>>


<<Maybe add another rule to catch `kubectl create -f foo` ?>>
