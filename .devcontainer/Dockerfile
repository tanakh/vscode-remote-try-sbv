#-------------------------------------------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See https://go.microsoft.com/fwlink/?linkid=2090316 for license information.
#-------------------------------------------------------------------------------------------------------------
FROM ubuntu:bionic

# Configure apt
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get -y install --no-install-recommends apt-utils 2>&1

# Install git, process tools, lsb-release (common in install instructions for CLIs)
RUN apt-get -y install git procps lsb-release

RUN apt-get -y install curl unzip libtinfo-dev

RUN curl -sSL https://get.haskellstack.org/ | sh
ENV PATH /root/.local/bin:$PATH

RUN stack update
RUN stack install sbv

WORKDIR /root
RUN curl -LO https://github.com/Z3Prover/z3/releases/download/z3-4.8.4/z3-4.8.4.d6df51951f4c-x64-ubuntu-16.04.zip
RUN unzip z3-4.8.4.d6df51951f4c-x64-ubuntu-16.04.zip 
ENV PATH /root/z3-4.8.4.d6df51951f4c-x64-ubuntu-16.04/bin:$PATH

# Clean up
RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*
ENV DEBIAN_FRONTEND=dialog
