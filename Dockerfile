FROM jenkins/jenkins:lts

USER root

RUN apt-get -y update
RUN apt-get -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common 

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN add-apt-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"

RUN apt-get update
RUN apt-get -y install docker-ce docker-ce-cli containerd.io

RUN apt-get install -y kubelet kubeadm kubectl kubernetes-cni

USER jenkins
