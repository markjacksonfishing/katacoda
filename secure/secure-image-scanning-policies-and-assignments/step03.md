There are multiple ways to install the sysdig-agent -we will use Helm Charts. You can review [Sysdig Documentation](https://docs.sysdig.com/en/agent-installation.html) to learn more about other installation methods.  

First, let’s install and update Helm and create a new namespace for the agent.

```
curl -fsSL https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
helm version
helm repo add stable https://kubernetes-charts.storage.googleapis.com
helm repo update
kubectl create ns sysdig-agent
```{{execute}}

For the next step you will require your own specific *Access Key*. You can find it on Sysdig configuration > Agent-key.

```
helm install training \
    --set sysdig.accessKey=FAKECAKEacceskeyInsertYoursHereFAKECAKE \
    --set sysdig.settings.tags="role:training\,location:universe" \
    --namespace sysdig-agent \
    stable/sysdig
```{{execute}}

It is as easy as that - you’ll now have the agent working in your cluster with Dynamic Auditing configured. It could take a few minutes to start running - in the meantime you can check at your Sysdig Dashboard that you can observe your cluster.


# Set Up a Container Registry
To perform the following lab exercises we will need a container repository.  This section will take you through setting up your own repository in Docker Hub and populating it with a number of containers.

Create an account in [Docker Hub](https://hub.docker.com/signup/) if you dont already have one, and create a ‘public’ repo.  Alternatively you can use an existing repository if you have one.

*Note* For the purposes of this lab, we will refer to this repository as ‘yourrepo’, i.e., `yourrepo/containername:tag`

Run the following command to pull down the required images locally

```
./dockerpull.sh
```{{execute}}

```
...
learnsysdig/dummy-vuln-app  latest     8a8bfed71406   3 months ago  533MB     learnsysdig/nginx           1.16.0     ae893c58d83f   5 months ago  109MB
learnsysdig/nginx           1.17.0     719cd2e3ed04   7 months ago  109MB
learnsysdig/node            10.8.0     0e2811757f93   17 months ago 673MB
learnsysdig/nginx           1.15.0     5699ececb21c   18 months ago 109MB
learnsysdig/nginx           1.10.0     16666ff3a57f   3 years ago   183MB
```


Retag the containers with your own repo name

```
./retagimages.sh
```{{execute}}


Before we push these images to your new repository you must log into Dockerhub.io at the command line

```
docker login
```{{execute}}

```
Login with your Docker ID to push and pull images from Docker Hub. If you don't have a Docker ID, head over to https://hub.docker.com to create one.
Username: yourrepo
Password: ********
WARNING! Your password will be stored unencrypted in /root/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded
```{{execute}}

Now push the containers to Docker Hub.

```
./pushtodockerhub.sh
```{{execute}}

Let’s also  create a container from scratch and load it into our repository.  We will return to this container later in the course and update the version

```
source ./.reponame
cd manifests/python-app
docker build -t $REPONAME/hello-world .
```{{execute}}
