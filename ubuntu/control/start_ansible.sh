#!/usr/bin/env bash
# ==========================================
# File: start_ansible.sh 
# Author: onsokumaru
# Date: 2022-09-08
# Description: script to kick off ansible
# control container
# ==========================================

# start ansible container with specified parameters
docker run -it \
    --name ansible-control \
    --hostname control \
    --mount type=bind,source="$(pwd)"/playbooks,target=/home/ansible/playbooks \
    ansible_ubuntu:latest

