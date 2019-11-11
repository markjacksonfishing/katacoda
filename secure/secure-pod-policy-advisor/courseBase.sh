git clone https://github.com/johnfitzpatrick/psp-demo.git
cp psp-demo/kube-apiserver.yaml /etc/kubernetes/manifests/kube-apiserver.yaml
mkdir -p /audit/log
cp assets/audit-policy.yaml /audit
