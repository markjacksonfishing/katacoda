apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    component: kube-apiserver
    tier: control-plane
  name: kube-apiserver
  namespace: kube-system
spec:
  containers:
  - command:
    - kube-apiserver
    - --advertise-address=172.17.0.79
    - --allow-privileged=true
    - --authorization-mode=Node,RBAC
    - --client-ca-file=/etc/kubernetes/pki/ca.crt
    - --enable-admission-plugins=NamespaceLifecycle,LimitRanger,ServiceAccount,DefaultStorageClass,DefaultTolerationSeconds,NodeRestriction,ResourceQuota,MutatingAdmissionWebhook,ValidatingAdmissionWebhook,PodSecurityPolicy
    - --enable-bootstrap-token-auth=true
    - --etcd-cafile=/etc/kubernetes/pki/etcd/ca.crt
    - --etcd-certfile=/etc/kubernetes/pki/apiserver-etcd-client.crt
    - --etcd-keyfile=/etc/kubernetes/pki/apiserver-etcd-client.key
    - --etcd-servers=https://127.0.0.1:2379
    - --insecure-port=0
    - --kubelet-client-certificate=/etc/kubernetes/pki/apiserver-kubelet-client.crt
    - --kubelet-client-key=/etc/kubernetes/pki/apiserver-kubelet-client.key
    - --kubelet-preferred-address-types=InternalIP,ExternalIP,Hostname
    - --proxy-client-cert-file=/etc/kubernetes/pki/front-proxy-client.crt
    - --proxy-client-key-file=/etc/kubernetes/pki/front-proxy-client.key
    - --requestheader-allowed-names=front-proxy-client
    - --requestheader-client-ca-file=/etc/kubernetes/pki/front-proxy-ca.crt
    - --requestheader-extra-headers-prefix=X-Remote-Extra-
    - --requestheader-group-headers=X-Remote-Group
    - --requestheader-username-headers=X-Remote-User
    - --secure-port=6443
    - --service-account-key-file=/etc/kubernetes/pki/sa.pub
    - --service-cluster-ip-range=10.96.0.0/12
    - --tls-cert-file=/etc/kubernetes/pki/apiserver.crt
    - --tls-private-key-file=/etc/kubernetes/pki/apiserver.key
    - --audit-policy-file=/audit/audit-policy.yaml
    - --audit-log-path=/audit/log
    - --audit-dynamic-configuration=true
    - --runtime-config=auditregistration.k8s.io/v1alpha1
    image: k8s.gcr.io/kube-apiserver:v1.14.0
    imagePullPolicy: IfNotPresent
    livenessProbe:
      failureThreshold: 8
      httpGet:
        host: 172.17.0.79
        path: /healthz
        port: 6443
        scheme: HTTPS
      initialDelaySeconds: 15
      timeoutSeconds: 15
    name: kube-apiserver
    resources:
      requests:
        cpu: 250m
    volumeMounts:
    - mountPath: /etc/ssl/certs
      name: ca-certs
      readOnly: true
    - mountPath: /etc/ca-certificates
      name: etc-ca-certificates
      readOnly: true
    - mountPath: /etc/pki
      name: etc-pki
      readOnly: true
    - mountPath: /etc/kubernetes/pki
      name: k8s-certs
      readOnly: true
    - mountPath: /usr/local/share/ca-certificates
      name: usr-local-share-ca-certificates
      readOnly: true
    - mountPath: /usr/share/ca-certificates
      name: usr-share-ca-certificates
      readOnly: true
    - mountPath: /audit
      name: auditlog
      readOnly: false
  hostNetwork: true
  priorityClassName: system-cluster-critical
  volumes:
  - hostPath:
      path: /audit
      type: DirectoryOrCreate
    name: auditlog
  - hostPath:
      path: /etc/ssl/certs
      type: DirectoryOrCreate
    name: ca-certs
  - hostPath:
      path: /etc/ca-certificates
      type: DirectoryOrCreate
    name: etc-ca-certificates
  - hostPath:
      path: /etc/pki
      type: DirectoryOrCreate
    name: etc-pki
  - hostPath:
      path: /etc/kubernetes/pki
      type: DirectoryOrCreate
    name: k8s-certs
  - hostPath:
      path: /usr/local/share/ca-certificates
      type: DirectoryOrCreate
    name: usr-local-share-ca-certificates
  - hostPath:
      path: /usr/share/ca-certificates
      type: DirectoryOrCreate
    name: usr-share-ca-certificates
status: {}





1  kubectl get nodes
2  git clone https://github.com/johnfitzpatrick/psp-sysdig.git
3  cd psp-sysdig/
4  ls -l
5  cat minikube.sh
6  cd /etc/kubernetes/manifests/
7  vi kube-apiserver.yaml
8  kubectl get psp
9  docker ps|grep api
10  kubectl get nodes
11  kubectl get psp
12  ls -l
13  cd
14  cd psp-sysdig/
15  ls -l
16  ls -l apps/
17  kubectl create -f nginx-deployment-foo.yaml
18  pwd
19  cd apps/
20  kubectl create -f nginx-deployment-foo.yaml
21  kubectl create ns nginx
22  kubectl create -f nginx-deployment-foo.yaml
23  kubectl get podes -n nginx
24  kubectl get pods -n nginx
25  kubectl get events
26  kubectl get events -n nginx
27  ls -l
28  cd ..
29  ls -l
30  kubectl create -f default-psp-with-rbac.yaml
31  kubectl create -f sysdig-psp-with-rbac.yaml
32  kubectl create ns sysdig-agent
33  kubectl create -f sysdig-psp-with-rbac.yaml
34  kubectl create -f privileged-psp-with-rbac.yaml
35  kubectl get psp
36  kubctl delete -f apps/nginx-deployment-foo.yaml
37  kubectl delete -f apps/nginx-deployment-foo.yaml
38  kubectl create -f apps/nginx-deployment-foo.yaml
39  kubectl get events -n nginx
40  kubectl get pods -n nginx
41  vi apps/nginx-deployment-foo.yaml
42  kubectl get psp
43  vi privileged-psp-with-rbac.yaml
44  ifconfig -a
45  clear
46  ps -ef|grep ssh
47  ssh -R 19999:localhost:22 john@brie.fourtytwo.space
48  pwd
49  kubectl delete psp --all
50  kubectl delete pods -n nginx --all
51  kubectl get pods -n nginx
52  kubectl get events -n nginx
53  kubectl get deployments -n nginx
54  kubectl create -f privileged-psp-with-rbac.yaml
55  kubectl create -f default-psp-with-rbac.yaml
56  kubectl create -f sysdig-psp-with-rbac.yaml
57  kubectl get psp
58  kubectl apply -f apps/nginx-deployment-foo.yaml
59  kubectl get pods -n nginx
60  kubectl delete -f apps/nginx-deployment-foo.yaml
61  kubectl create -f apps/nginx-deployment-foo.yaml
62  kubectl get pods -n nginx
63  kubectl describe pods -n nginx
64  pwd
65  clear
66  ls -l
67  cat config_audit.sh
68  vi /etc/kubernetes/manifests/
69  vi /etc/kubernetes/manifests/kube-apiserver.yaml
70  pwd
71  mkdir -p /audit
72  cd /audit/
73  cp /root/psp-sysdig/audit-policy.yaml .
74  ls -l
75  vi /etc/kubernetes/manifests/kube-apiserver.yaml
76  cagt $_
77  cat $_
78  history













apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    component: kube-apiserver
    tier: control-plane
  name: kube-apiserver
  namespace: kube-system
spec:
  containers:
  - command:
    - kube-apiserver
    - --advertise-address=172.17.0.79
    - --allow-privileged=true
    - --authorization-mode=Node,RBAC
    - --client-ca-file=/etc/kubernetes/pki/ca.crt
    - --enable-admission-plugins=NamespaceLifecycle,LimitRanger,ServiceAccount,DefaultStorageClass,DefaultTolerationSeconds,NodeRestriction,ResourceQuota,MutatingAdmissionWebhook,ValidatingAdmissionWebhook,PodSecurityPolicy
    - --enable-bootstrap-token-auth=true
    - --etcd-cafile=/etc/kubernetes/pki/etcd/ca.crt
    - --etcd-certfile=/etc/kubernetes/pki/apiserver-etcd-client.crt
    - --etcd-keyfile=/etc/kubernetes/pki/apiserver-etcd-client.key
    - --etcd-servers=https://127.0.0.1:2379
    - --insecure-port=0
    - --kubelet-client-certificate=/etc/kubernetes/pki/apiserver-kubelet-client.crt
    - --kubelet-client-key=/etc/kubernetes/pki/apiserver-kubelet-client.key
    - --kubelet-preferred-address-types=InternalIP,ExternalIP,Hostname
    - --proxy-client-cert-file=/etc/kubernetes/pki/front-proxy-client.crt
    - --proxy-client-key-file=/etc/kubernetes/pki/front-proxy-client.key
    - --requestheader-allowed-names=front-proxy-client
    - --requestheader-client-ca-file=/etc/kubernetes/pki/front-proxy-ca.crt
    - --requestheader-extra-headers-prefix=X-Remote-Extra-
    - --requestheader-group-headers=X-Remote-Group
    - --requestheader-username-headers=X-Remote-User
    - --secure-port=6443
    - --service-account-key-file=/etc/kubernetes/pki/sa.pub
    - --service-cluster-ip-range=10.96.0.0/12
    - --tls-cert-file=/etc/kubernetes/pki/apiserver.crt
    - --tls-private-key-file=/etc/kubernetes/pki/apiserver.key
    - --audit-policy-file=/audit/audit-policy.yaml
    - --audit-log-path=/audit/log
    - --audit-dynamic-configuration=true
    - --runtime-config=auditregistration.k8s.io/v1alpha1
    - --feature-gates=DynamicAuditing=true
    image: k8s.gcr.io/kube-apiserver:v1.14.0
    imagePullPolicy: IfNotPresent
    livenessProbe:
      failureThreshold: 8
      httpGet:
        host: 172.17.0.79
        path: /healthz
        port: 6443
        scheme: HTTPS
      initialDelaySeconds: 15
      timeoutSeconds: 15
    name: kube-apiserver
    resources:
      requests:
        cpu: 250m
    volumeMounts:
    - mountPath: /etc/ssl/certs
      name: ca-certs
      readOnly: true
    - mountPath: /etc/ca-certificates
      name: etc-ca-certificates
      readOnly: true
    - mountPath: /etc/pki
      name: etc-pki
      readOnly: true
    - mountPath: /etc/kubernetes/pki
      name: k8s-certs
      readOnly: true
    - mountPath: /usr/local/share/ca-certificates
      name: usr-local-share-ca-certificates
      readOnly: true
    - mountPath: /usr/share/ca-certificates
      name: usr-share-ca-certificates
      readOnly: true
    - mountPath: /audit
      name: auditlog
      readOnly: false
  hostNetwork: true
  priorityClassName: system-cluster-critical
  volumes:
  - hostPath:
      path: /audit
      type: DirectoryOrCreate
    name: auditlog
  - hostPath:
      path: /etc/ssl/certs
      type: DirectoryOrCreate
    name: ca-certs
  - hostPath:
      path: /etc/ca-certificates
      type: DirectoryOrCreate
    name: etc-ca-certificates
  - hostPath:
      path: /etc/pki
      type: DirectoryOrCreate
    name: etc-pki
  - hostPath:
      path: /etc/kubernetes/pki
      type: DirectoryOrCreate
    name: k8s-certs
  - hostPath:
      path: /usr/local/share/ca-certificates
      type: DirectoryOrCreate
    name: usr-local-share-ca-certificates
  - hostPath:
      path: /usr/share/ca-certificates
      type: DirectoryOrCreate
    name: usr-share-ca-certificates
status: {}
