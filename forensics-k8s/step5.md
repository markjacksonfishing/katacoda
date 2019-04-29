Being able to investigate an issue is nice, but what would be truly great is if, somehow, Falco automagically executed a certain action to respond to a security threat.

This is called a _response engine_. It works like this:

- _[Falco](https://sysdig.com/opensource/falco/)_ monitors containers and processes to alert on unexpected behavior. This is defined through the runtime policy built from multiple rules that define what the system should and shouldn't do.
- _falco-nats_ forwards the alert to a message broker service, into a topic compound by `falco.<severity>.<rule_name_slugified>`.
- _[NATS](https://nats.io/)_, our message broker, delivers the alert to any subscribers to the different topics.
- _[Kubeless](https://kubeless.io/)_, a Function as a Service (FaaS) framework that runs in Kubernetes, receives the security events and executes the configured playbooks.

A _playbook_ is the piece code executed when an alert is received to respond to that threat in an automated way. Some examples include:

- sending an alert to Slack
- stop the pod killing the container
- taint the specific node where the pod is running

Installing the prerequisites
----------------------------

Let's install `pip`, and then use it to install `pipenv`:

`curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py
export PATH=$PATH:~/.local/bin
pip install --user pipenv`{{execute HOST1}}

Next let's create a `kubeless` namespace and deploy kubeless.

`export RELEASE=$(curl -s https://api.github.com/repos/kubeless/kubeless/releases/latest | grep tag_name | cut -d '"' -f 4)
kubectl create ns kubeless
kubectl create -f https://github.com/kubeless/kubeless/releases/download/$RELEASE/kubeless-$RELEASE.yaml`{{execute HOST1}}

We can see the pods created:
`kubectl get pods -n kubeless`{{execute HOST1}}

The deployment:
`kubectl get deployment -n kubeless`{{execute HOST1}}

And the _functions_ Custom Resource Definition:
`kubectl get customresourcedefinition`{{execute HOST1}}

We will also need the `zip` utility:
`sudo apt install zip`{{execute HOST1}}

Finally, we install the Kubeless CLI:

`export OS=$(uname -s| tr '[:upper:]' '[:lower:]')
curl -OL https://github.com/kubeless/kubeless/releases/download/$RELEASE/kubeless_$OS-amd64.zip
unzip kubeless_$OS-amd64.zip
sudo mv bundles/kubeless_$OS-amd64/kubeless /usr/local/bin/`{{execute HOST1}}

Installing the Kubernetes Response Engine for Sysdig Falco
----------------------------------------------------------

Once we have all of the above, we can deploy NATS using a Kubernetes Operator and the Kubeless framework that makes use of Kubernetes Custom Resource.

`git clone https://github.com/falcosecurity/kubernetes-response-engine.git
cd kubernetes-response-engine/deployment/cncf
make`{{execute HOST1}}

In case `make` fails, just run `make`{{execute HOST1}} again.

We also have to remove the current falco installation, and install a new one with the output to the NATS server enabled:

`cd
helm del --purge falco
helm install --name falco --set integrations.natsOutput.enabled=true -f custom_rules.yaml stable/falco`{{execute HOST1}}

Executing `kubectl get pods`{{execute HOST1}} we will notice that each falco pod has now two containers: `falco` and `falco-nats`.
