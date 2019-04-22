With Jenkins unlocked, execute the next script in other terminal (the first one will be blocked, it has to redirect the ports to your own machine):

`./populate.sh`{{execute T2}}

This will automatically extract the bundled plugins with the image and create the pipelines we are going to use.

Jenkins will be restarted automatically, and you will need to **log in again** using the credentials shown in the terminal.