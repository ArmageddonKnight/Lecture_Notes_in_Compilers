FROM ubuntu:22.04

RUN sed -i 's/#force_color_prompt=yes/force_color_prompt=yes/' ~/.bashrc

# https://stackoverflow.com/a/71982514/6320608
RUN rm -f /etc/apt/apt.conf.d/docker-clean && apt-get update

RUN apt-get install -y \
        vim \
        wget \
        git \
        bear \
        build-essential

# GCC
RUN apt-get install -y flex bison flexc++ bisonc++

RUN rm -rf /var/lib/apt/lists/*

RUN git config --global --add safe.directory "*" && \
        git config --global core.editor vim && \
        git config --global credential.helper store && \
        git config --global pull.rebase false && \
        git config --global user.name "ubuntu" && \
        git config --global user.email "ubuntu@cs.toronto.edu"

WORKDIR /mnt
