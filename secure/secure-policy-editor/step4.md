# Policy Rules Library

To see more information on the specific rules, click 'Policies' on the left menu, then 'Rules Library'.

![View Rules Library](/sysdig/courses/secure/secure-policy-editor/assets/image02.png)

Rules are categories by tags, so you can group them, for example, by functionality, security standard, or by target. You can see the origin of the rule and when it was last updated for audit purposes.  Two search boxes allow you to search for a particular rule by rule name or by tag.

The Sysdig Rules Library provides a comprehensive runtime security library right out of the box consisting of container specific policies from Sysdig's threat research team, Falco open source community rules as well as international security benchmarks, for example CIS and MITRE ATT&CK.

## Problem Scenario
Let's look at these policies and rules in a real life example. We would like to raise an event if someone write below '`home`' within a container.  Out of the box there are rules for write below '`root`' and '`etc`', but not '`home`'. So we will have to create this rule and apply it.

The steps we'll go through are

 1. Create the rule in the Rules Library
 2. Add the new rule to a policy, and set the policy scope
 3. Test our new policy containing our rule
