FROM rockylinux:8.5.20220308

LABEL maintainer="howhow  -> https://how64bit.com"
USER root
RUN curl https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo -o /etc/yum.repos.d/hashicorp.repo
RUN dnf install -y wget python39-devel terraform git openssh-*
RUN pip3 install ansible && \
  ssh-keygen -A && \
  ssh-keygen -q  -N  "" -f ~/.ssh/id_rsa && \
  mkdir -p /root/lab && \
  git -C /root/lab clone  https://github.com/TGC101/iac-gce-k8s.git &&\
  dnf clean all && rm -fr /var/cache 
WORKDIR /root/lab
RUN chmod +x /root/lab/iac-gce-k8s

CMD ["tail","-f","/dev/null"]
