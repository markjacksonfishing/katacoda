#!/bin/bash
# Initialize the cluster with a known token
kubeadm init --token=fabada.feedcafebabeface --kubernetes-version $(kubeadm version -o short)

# Copy the configuration created by kubeadm to the user's home directory
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# You should now deploy a pod network to the cluster.
# kubectl apply -f [podnetwork].yaml
# with one of the options listed at https://kubernetes.io/docs/concepts/cluster-administration/addons/
kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"

# You can now join any number of machines by running the following on each node as root:
# kubeadm join xx.xx.xx.xx:6443 --token fabada --discovery-token-ca-cert-hash sha256:XXX

echo "#!/bin/bash" > /tmp/join.sh
echo "kubeadm join $(ip addr show ens3 | grep -Eo '([0-9]*\.){3}[0-9]*' | head -1):6443 --token fabada.feedcafebabeface --discovery-token-unsafe-skip-ca-verification" >> /tmp/join.sh
chmod a+x /tmp/join.sh
scp -q -o StrictHostKeyChecking=no /tmp/join.sh node01:/usr/local/bin/
