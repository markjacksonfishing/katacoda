git clone https://github.com/johnfitzpatrick/psp-demo.git
mkdir -p /audit
cp psp-demo/audit-policy.yaml /audit
cp psp-demo/kube-apiserver.yaml /etc/kubernetes/manifests/kube-apiserver.yaml
alias k='kubectl'
alias kn='kubectl get nodes'
