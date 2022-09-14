#!/usr/bin/env bash
# ==========================================
# File: start_ansible.sh 
# Author: onsokumaru
# Date: 2022-09-08
# Description: script to kick off ansible
# target container
# ==========================================

if [[ $# != 1  ]]; then
   >&2 echo "Illegal number of parameters"
else
    echo $1
    # start ansible target container with specified parameters
    docker run \
        --name ansible-control \
        -p 22:22 \
        --hostname node${1} \
        ansible_node:latest
fi
