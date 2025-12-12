FROM ghcr.io/actions/actions-runner:2.329.0

RUN curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

RUN sudo apt-get update && \
    sudo apt-get install -y zstd wget build-essential && \
    sudo rm -rf /var/lib/apt/lists/*
