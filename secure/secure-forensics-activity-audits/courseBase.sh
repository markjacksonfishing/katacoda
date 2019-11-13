mkdir -p manifests
mkdir -p manifests2
mkdir -p /audit
mv manifests/audit-policy.yaml /audit
mv manifests/audit-webhook.yaml /audit
cp /etc/kubernetes/manifests/kube-apiserver.yaml /etc/kubernetes/manifests/kube-apiserver.BAK.yaml
mv manifests/kube-apiserver.yaml /etc/kubernetes/manifests/kube-apiserver.yaml
alias k='kubectl'
alias kn='kubectl get nodes'
