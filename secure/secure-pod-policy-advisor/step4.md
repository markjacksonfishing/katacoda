Click on *Deployment.yaml* and upload your Deployment.yaml definition. Sysdig PSP Advisor will automatically generate a *PSP.yaml* file based on the specs of this deployment. This PSP file meets the least privileged criteria, its tailored for your deployment and because of this it's ready to apply into production!

SCREENSHOT

But wait. You don't have to apply it yet. With PSP Advisor you can just simulate it to check everything will behave as expected when the PSP will be applied. In other words, this function allows you to evaluate which output/errors your cluster will return to you if you would ever applied this PSP to your cluster.

Click on start simulation. Or something like that, CHECK THIS MYSELF PABLOOOOOOO!!!

Now, apply your deployment.

`foo -f bigfoo uwu iwi`{{execute}}

As we generated the minimum privileged PSP, it won't output any error. This PSP definition file is ready to be applied right into production!

*NOTE: PSPs also protect us from our dev team. Imagine that you have into production and app with permissions X. At any point in the future a dev team change its image requirements, if they don't meet the police, PSP Advisor will complain about it.*



