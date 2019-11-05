
If we required a complex rule, and there was a similar one in the library, then we could duplicate the existing rule and modify it, as illustrated below.

![Copy existing Rule](/sysdig/courses/secure/secure-policy-editor/assets/image04.png)

However, for our example we shall create the rule from scratch.

Rules are written in Falco. Falco is a YAML based open source security rules engine designed specifically for cloud native environments.  Since Falco is Yaml based, and hence human readable, we can manipulate the rules in a text editor, or within the console UI.

Click `Add Rule` link in the top left. You'll notice these options are tailored for specific rule conditions, such as network (inbound/outbound connections), File System (read/write operations etc), etc.  These are referred to as 'fast rules' and are essentially white list and black lists.

For our scenario select Falco (/sysdig/courses/secure/secure-policy-editor/assets/image05.png) which is a much richer langue for defining rules.

Complete the form filling in the following information

 - Name: `Directory Created`
 - Description: `A directory has been created on the container`
 - Condition: `evt.type = mkdir`
 - Output: `A directory has been created on (user=%user.name command=%proc.cmdline parent=%proc.pname file=%fd.name program=%proc.name container_id=%container.id image=%container.image.repository)`
 - Priority: `Critical`
 - Source: `Syscall`
 - Tags: `container` `filesystem`

 Click `Save` to save the new rule to the Rules Library.

 Now find your new rule in the library and highlight it. You will notice our rule details have been translated into Falco YAML code.

 ![View Your New Rule in the Library](/sysdig/courses/secure/secure-policy-editor/assets/image06.png)
