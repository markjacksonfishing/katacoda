Now that we have a PSP running to allow the application into the cluster and a specific PSP to our application, we can deploy the application.

Execute the following script to automate the deployment of the application:

```
.pspSketch/apps/create.sh
```{{execute}}

This script will:

 - create a new namespace for the application, 
 - create a deployment for the app, and
 - apply the deployment. 

Note that, at this point, the app has been validated by a loose policy, so in case of misbehavior, it would have space to “abuse” this excess of confidence and take more privileges than the ones it’s intended to have.

Validating the policy
Now, go back to Sysdig and validate the new policy we generated in the previous step. This new feature allows you to validate a policy without running it in production. This way, you avoid breaking anything because of a bad policy definition. Sysdig uses the audit to read the pod definition and compare it against the PSP you want to simulate.
Two paths here to take and have a meaningful example:
 - Image or example of how it looks a good simulation. [screenshot]
 - Red lights of how would it be to have it wrong. [screenshot]
