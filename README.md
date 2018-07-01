# Kubernetes Resources

All the kubernetes resources for my self-hosted infrastructure. 

To stand up a stand alone Kubernetes cluster on Fedora 28 run:

```shell
root@server $ dnf install kubernetes-kubeadm
root@server $ ./deploy.sh
root@server $ vi /etc/sysconfig/selinux # set SELINUX=permissive
``` 