In order to follow this course, you will need a [Sysdig](http://sysdig.com/) Monitor account.

If you do not have have a Sysdig account, you can set one up by clicking [Not a customer? Try for free](https://sysdig.com/sign-up/) and following the instructions. Refer to the [Getting Up and Running with Sysdig](https://www.katacoda.com/sysdig-devel/courses/scvs/lab01) scenario for further details.

Click on the "Sysdig" tab and log in the Sysdig Monitor web UI. You can click the ![pop-out](/sysdig-devel/courses/scvs/lab06/assets/00_pop_out.png) icon to open this in a new tab in your browser.

Alternatively you can point your browser at <https://secure.sysdig.com>.

After logging in, go to your profile Settings, and in the `Agent Installation` tab you will find your Access Key (something like `5ca1ab1e-d3ad-beef-dea1-deba7ab1ed0c`).  Keep it handy, as you will need it to authorize the agent against the backend.

![Agent key](/sysdig-devel/courses/scvs/lab06/assets/00_access_key.png)

We have set up a Kubernetes cluster just for you.

Now click on the 'Terminal' tab. We will install the Sysdig Agent using Helm, a package manager for Kubernetes, which is already installed and initialized.

It only takes a simple command:

`helm install --name sysdig --set sysdig.accessKey=YOUR_OWN_ACCESS_KEY,sysdig.settings.tags="cluster:training\,location:europe" stable/sysdig`

After copying the above command, you can paste it into the terminal using the right button of your mouse.  Remember you have to use **your own access key**.

This will result in a Sysdig Agent Pod being deployed to each node, and thus the ability to monitor any running containers.

Creating the containers may take a little time.  Run the command below, which waits for all pods to be ready.  
`watch kubectl get pods`  
When the pods show status `Running`, hit <kbd>Ctrl</kbd>-<kbd>C</kbd> and clear the screen.
