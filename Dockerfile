FROM ghcr.io/actions/actions-runner:2.334.0

# Install build essentials
RUN sudo apt-get update && \
    sudo apt-get install -y zstd wget build-essential apt-transport-https ca-certificates curl file make jq unzip autoconf automake gcc g++ gnupg && \
    sudo rm -rf /var/lib/apt/lists/*

# Install azure cli
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Install docker compose
RUN curl -sL $(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r '.assets  | map(select(.name=="docker-compose-linux-x86_64"))[0].browser_download_url') -o /tmp/docker-compose && \
    sudo mv /tmp/docker-compose /usr/local/lib/docker/cli-plugins/docker-compose && \
    sudo chmod +x /usr/local/lib/docker/cli-plugins/docker-compose 
    
COPY rootfs /

