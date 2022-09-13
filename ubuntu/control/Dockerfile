# syntax=docker/dockerfile:1.0
# ansible host based on ubuntu docker image

FROM ubuntu:jammy

ENV DEBIAN_FRONTEND=noninteractive
ENV PATH=/home/ansible/.local/bin:$PATH

RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y \
    git curl build-essential vim-tiny \
    openssh-client ca-certificates \
    python3 python3-dev python3-pip \
    python3-venv python3-paramiko sudo \
    && rm -rf /var/lib/apt/lists/* \
    && useradd -m -G sudo -c "ansible user" -s /bin/bash ansible \
    && echo "ansible ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
    && mkdir -p /etc/ansible/library \
    && mkdir /home/ansible/.ssh \
    && su -c "sudo python3 -m pip install ansible" ansible \
    && su -c "ansible-config init --disabled > /home/ansible/.ansible.cfg" ansible 

COPY hosts /etc/ansible/hosts
COPY ssh/id_rsa ssh/id_rsa.pub /home/ansible/.ssh/

RUN chown ansible:ansible /home/ansible/.ssh \
    && chown ansible:ansible /home/ansible/.ssh/id_rsa.pub \
    && chown ansible:ansible /home/ansible/.ssh/id_rsa \
    && chmod 700 /home/ansible/.ssh 
    

WORKDIR /home/ansible

USER ansible

CMD ["bash"]
