# Shell script to deploy flannel network

printf "\n\e[36mEnabling Docker daemon\e[0m\n"
systemctl enable --now docker

printf "\n\e[36mSetting SELinux to permissive\e[0m\n"
setenforce 0

printf "\n\e[36mInitializing cluster\e[0m\n"
kubeadm init --pod-network-cidr=10.244.0.0/16

printf "\n\e[36mDeploying Flannel network\e[0m\n"
export KUBECONFIG=/etc/kubernetes/admin.conf
sysctl net.bridge.bridge-nf-call-iptables=1
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/v0.10.0/Documentation/kube-flannel.yml

printf "\n\e[36mRemoving Taint on Master node\e[0m\n"
kubectl taint nodes --all node-role.kubernetes.io/master-

printf "\n\e[36mDeploying HAProxy Ingress controller\e[0m\n"
kubectl create -f https://raw.githubusercontent.com/jcmoraisjr/haproxy-ingress/master/docs/haproxy-ingress.yaml
kubectl label node <node-name> role=ingress-controller