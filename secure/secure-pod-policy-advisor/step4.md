This is the `deployment.yaml` we'll be using for this scenario.

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deploymentV1
  namespace: default
  labels:
    app: nginx
spec:
  replicas: 1
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.7.9
        ports:
        - containerPort: 80
```{{copy}}

Copy its content and use it to create a new `deployment.yaml` file at your local machine.

Click on `Deployment YAML` and upload your *Deployment.yaml* you've just created. Sysdig PSP Advisor will automatically generate a *PSP.yaml* file based on the specs of this deployment. This PSP file meets the **least privileged** criteria, its tailored for your deployment and because of this it's ready to apply into production!

![Deployment](/sysdig/courses/secure/secure-pod-policy-advisor/assets/image5.png)

Once it has been uploaded, click on `Generate PSP` and you'll have the file prepared. Then click on `Save`.

But wait. You don't have to apply it yet. With PSP Advisor you can just simulate it to check everything will behave as expected when applying the PSP. In other words, this function allows you to evaluate which output/errors your cluster will return to you if you would have ever applied this PSP to your cluster.

Click on `start simulation` at the top right corner. It will inform you about no events generated just yet.

Now, go back to the terminal tab and:

1. create the deployment.yaml file with the contents at the top of this step: `vi deploymentV1.yaml`{{execute}}

2. save it and apply it to your deployment with: `kubectl apply -f deploymentV1.yaml`{{execute}}

(TIP: you can check your Sysdig Monitor to watch it running).

As we generated the least privileged PSP, it won't output any error. This PSP definition file is optimal and ready to be applied right into production!

*NOTE: PSPs also protect us from our dev team. Imagine that you have into production an app with a defined set of permissions. At any point in the future your dev team change its image requirements, having them higher permissions requeriments. As it won't meet the police, PSP Advisor will alert you about the problem and its solution.*
