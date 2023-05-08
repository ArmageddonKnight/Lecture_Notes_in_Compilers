FROM ubuntu:22.04

RUN sed -i 's/#force_color_prompt=yes/force_color_prompt=yes/' ~/.bashrc

RUN apt-get update
RUN export DEBIAN_FRONTEND=noninteractive

RUN apt-get install -y vim \
        git \
        build-essential \
        bear \
        python3-dev \
        python-is-python3 \
        wget \
        ca-certificates \
        doxygen \
        graphviz

RUN wget https://bootstrap.pypa.io/get-pip.py && \
        python3 get-pip.py && rm -f get-pip.py

RUN pip3 install cmake==3.26.3

# GCC
RUN apt-get install -y flex bison flexc++ bisonc++

# LLVM
RUN apt-get install -y lsb-release \
        software-properties-common \
        gpg-agent
RUN pip3 install lib==16.0.3

RUN export DEBIAN_FRONTEND=dialog
RUN rm -rf /var/lib/apt/lists/*

RUN git config --global --add safe.directory "*" && \
        git config --global core.editor vim && \
        git config --global credential.helper store && \
        git config --global pull.rebase false && \
        git config --global user.name "ubuntu" && \
        git config --global user.email "ubuntu@cs.toronto.edu"

WORKDIR /mnt
