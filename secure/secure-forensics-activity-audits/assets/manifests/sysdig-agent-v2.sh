# kubectl create ns sysdig-agent
# kubectl create -f sysdig-account.yaml -n sysdig-agent
# kubectl create -f sysdig-secret.yaml -n sysdig-agent
# kubectl create configmap sysdig-agent --from-file=dragent.yaml -n sysdig-agent
# kubectl create -f sysdig-daemonset-ebpf.yaml -n sysdig-agent
# kubectl create -f sysdig-agent-service.yaml -n sysdig-agent
#
#
kubectl create ns sysdig-agent
kubectl create secret generic sysdig-agent --from-literal=access-key=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx -n sysdig-agent
kubectl apply -f sysdig-agent-clusterrole.yaml -n sysdig-agent
kubectl create serviceaccount sysdig-agent -n sysdig-agent
kubectl create clusterrolebinding sysdig-agent --clusterrole=sysdig-agent --serviceaccount=sysdig-agent:sysdig-agent
