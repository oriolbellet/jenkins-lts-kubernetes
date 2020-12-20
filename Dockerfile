FROM jenkins/jenkins:lts

RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
RUN echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list

RUN apt-get update
RUN apt-get install -y kubelet kubeadm kubectl kubernetes-cni
