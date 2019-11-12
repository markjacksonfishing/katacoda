mkdir -p manifests
mkdir -p /audit
mv manifests/audit-policy.yaml /audit
mv manifests/audit-webhook.yaml /audit
mv manifests/kube-apiserver.yaml /etc/kubernetes/manifests/kube-apiserver.yaml
git clone https://github.com/johnfitzpatrick/psp-demo.git
alias k='kubectl'
alias kn='kubectl get nodes'
