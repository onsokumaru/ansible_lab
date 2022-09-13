# syntax=docker/dockerfile:1.0
# ansible host based on ubuntu docker image

FROM ubuntu:jammy

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y \
    openssh-server passwd sudo \
    && rm -rf /var/lib/apt/lists/* \
    && useradd -m -G sudo -u 1000 -c "ansible user" -s /bin/bash ansible \
    && usermod -aG sudo ansible \
    && echo "ansible ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
    && echo "ansible:ansible" | chpasswd \
    && service ssh start \
    && mkdir /home/ansible/.ssh \
    && touch /home/ansible/.ssh/authorized_keys

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
