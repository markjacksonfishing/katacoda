
Rules are the building blocks for policies, so we need to create a new policy and add our rule to it.  In a real situation a policy may be made up up of many rules, but for our example we will just add the one.

Now navigate to Policies > Runtime Policies, then click 'Add Policy'. Complete the form filling in the following information

 - Name: `Directory Created on container`
 - Description: `A directory has been created in a container`
 - Enabled: Yes
 - Severity: high
 - Scope: `Containers Only`

![Create Policy](/sysdig/courses/secure/secure-policy-editor/assets/image07.png)

For Rules, click `Import from Library`, then find and select the rule `Directory Created` that you created earlier.  Click 'Mark for import', then 'Import Rules'.

![Import Rules](/sysdig/courses/secure/secure-policy-editor/assets/image08.png)

Finally, once the rules have been added, define the actions that should occur once this policy is raised.

![Define Actions](/sysdig/courses/secure/secure-policy-editor/assets/image09.png)

For our example choose to 'Stop' the container and send an email notification.  Optionally you may create a capture, although captures are out of scope of this particular lesson.

![Tip](/sysdig/courses/secure/secure-policy-editor/assets/feature_ligtbulb_50x50.png) Please note that in order to receive email notifications, you must enable the email notification channel in your Sysdig Secure account. See Setting > Notifications.

Click 'Save'.
