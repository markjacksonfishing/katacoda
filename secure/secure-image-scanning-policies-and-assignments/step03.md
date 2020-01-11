{{Insert new canned lab setup routine}}

In order to follow this course, you will need a [Sysdig Secure](http://secure.sysdig.com/) account.

If you do not have a Sysdig Account, then you can sign up for a 30 day trial here https://sysdig.com/training-trial-signup/.  You will receive an email with a link guiding you through the setup process.

Click on the "Sysdig" tab and log in the Sysdig Secure web UI. You can click the ![pop-out](/sysdig-devel/courses/scvs/lab06/assets/00_pop_out.png) icon to open this in a new tab in your browser.

>>New screenshot

Alternatively you can point your browser at <https://secure.sysdig.com>.

After logging in, go to your profile Settings, and in the `Agent Installation` tab you will find your Access Key (something like `5ca1ab1e-d3ad-beef-dea1-deba7ab1ed0c`).  Keep it handy, as you will need it to authorize the agent against the backend.

![Agent key](/sysdig-devel/courses/scvs/lab06/assets/00_access_key.png)

*Note:* There is a similar formatted token called 'Sysdig Secure API Token' on the 'User Profile' page which may cause confusion. Be sure to use the correct token in the 'Agent Installation' tab.

We have set up a Kubernetes cluster just for you.

Now click on the 'Terminal' tab. We will install the Sysdig Agent using Helm, a package manager for Kubernetes, which is already installed and initialized.

It only takes a simple command:

`helm install --name sysdig --set sysdig.accessKey=YOUR_OWN_ACCESS_KEY,sysdig.settings.tags="cluster:training\,location:europe" stable/sysdig`

After copying the above command, you can paste it into the terminal using the right button of your mouse.  Remember you have to use **your own access key**.

This will result in a Sysdig Agent Pod being deployed to each node, and thus the ability to monitor any running containers.

Creating the containers may take a little time.  Run the command below, which waits for all pods to be ready.  
`watch kubectl get pods`  
When the pods show status `Running`, hit <kbd>Ctrl</kbd>-<kbd>C</kbd> and clear the screen.
