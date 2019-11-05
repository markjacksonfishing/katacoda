# Enable default policies

Click on ‘Policies’ on the left menu of Sysdig Secure, then ‘Runtime Policies’. For a new account, you should be shown ‘You have not configured any policies’, so click ‘Use Sysdig Default Policies’.

![Auto-generate suggested Sysdig default policies](/sysdig/courses/secure/secure-policy-editor/assets/image01.png)

This will deploy the default policy set, which is a generic set designed to cover 95% of common detection scenarios. The policies are enabled by default, but no notification or preventative actions are configured, so only events within the Sysdig Platform will be created.

If you highlight a Runtime Policy you'll see details on a panel on the right. For example, click on 'Suspicious Container Activity' to see what rules make up this policy.

![View Policy Details](/sysdig/courses/secure/secure-policy-editor/assets/image02.png)
