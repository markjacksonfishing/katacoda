Now, let's test an scenario that let us appreciate the power of the simulation functionality. 

Suppose that your team generated the same PSP definition we automatically generated in last step. But, your deployment requires more privileges than allowed here (for example, running as privileged).

Show the new file here.

Apply deployment:
` `{{execute}}

As PSP is not activated yet at our cluster, our deployment will be created smoothly and without complaints(remember that we are still simulating PSP effects on our cluster!). But, here comes the key, the simulation at Sysdig will output an event letting us now that this deployment is conflicting with our defined PSP. In a real production environment, this would have been problems for us (services not working, pods not being created, etc.) but here we are taking a step ahead preventing this to happen. 

With this information, we'll be able to edit our deployment (or maybe the PSP) in order to make them work together. Or, as we show in the previous step, we can just generete the optimal PSP definition for our cluster. Easy peasy lemon squeezy.