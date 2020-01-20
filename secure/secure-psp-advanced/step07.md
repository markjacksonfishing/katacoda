While you don’t have a perfect PSP for your app, you need a permissive one for it to allow it to run at the cluster.

```
kubectl apply -f test-psp.yaml
```

This PSP will be the one allowing your app pod into the cluster. This way, we’ll be able to dry-run the new policy that Sysdig PSP Advisor will generate automatically for us in the next step. All of it avoiding the pod being stopped.
