mkdir -p manifests
mkdir -p /audit
mv audit-policy.yaml /audit
mv audit-webhook.yaml /audit
mv kube-apiserver.yaml /etc/kubernetes/manifests/kube-apiserver.yaml
alias k='kubectl'
alias kn='kubectl get nodes'
