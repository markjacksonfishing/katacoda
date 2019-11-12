<<WORK IN PROGRESS>>

A Sysdig Secure Runtime Policy is a combination of rules about activities an enterprise wants to detect in an environment, the actions that should be taken if the policy rule is breached, and, potentially, the notifications or other actions that should be invoked.

<<Editor Note: The steps in this course came from https://docs.google.com/document/d/1gz2gy4AGUVhfjzIMLAYTV47uIU9O-PrYW6cJhWj5Hrs/edit#

Maybe make them more succinct>>


<<
WIP - Install Sysdig agent
1. Get Access Key from UI (say fakefake-1ad2-4a47-8689-e5bb6c1a2ba7)
2. Base64 encode it (e.g. echo -n fakefake-1ad2-4a47-8689-e5bb6c1a2ba7 |base64)
3. Put encoded key into sysdig-secret.yaml
4. Run script ./apps/sysdig-agent.sh

>>
