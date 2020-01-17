mkdir -p manifests
mkdir -p /audit
mv manifests/audit-policy.yaml /audit
mv manifests/audit-webhook.yaml /audit
cp /etc/kubernetes/manifests/kube-apiserver.yaml /etc/kubernetes/manifests/kube-apiserver.BAK.yaml
mv manifests/kube-apiserver.yaml /etc/kubernetes/manifests/kube-apiserver.yaml

# Update the IP
NEW_IP=$(kubectl config view | grep server | egrep -o "[[:digit:]]+.[[:digit:]]+.[[:digit:]]+.[[:digit:]]+")
sed -i "s/172.17.0.79/$NEW_IP/" /etc/kubernetes/manifests/kube-apiserver.yaml

alias k='kubectl'
alias kn='kubectl get nodes'
