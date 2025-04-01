#!/bin/bash

set -e

# Update package index
sudo apt update

# Install Go v1.23.2
echo "Installing Go v1.23.2..."
wget https://golang.org/dl/go1.23.2.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.23.2.linux-amd64.tar.gz
rm go1.23.2.linux-amd64.tar.gz
echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.bashrc
source ~/.bashrc

# Install Helm
echo "Installing Helm..."
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Install AWS CLI
echo "Installing AWS CLI..."
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf awscliv2.zip aws

# Install kubectl
echo "Installing kubectl..."
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm kubectl

# Install Docker
echo "Installing Docker..."
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce
sudo usermod -aG docker ${USER}

# Install eksctl
echo "Installing eksctl..."
curl -L "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin

# Install Lua
#echo "Installing Lua..."
#sudo apt install -y lua5.4

# Install Luarocks
#echo "Installing Luarocks..."
#sudo apt install -y luarocks

# Install Neovim
#echo "Installing Neovim..."
#sudo apt install -y neovim

# Install Node.js and npm
#echo "Installing Node.js and npm..."
#curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -
#sudo apt install -y nodejs

# Install Rust
#echo "Installing Rust and Cargo..."
#curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
#source $HOME/.cargo/env
#echo "export PATH=\$PATH:$HOME/.cargo/bin" >> ~/.bashrc

#Installing repos
#git clone https://github.com/GeraldoSJr/my-nvim-lsp.git ~/.config/nvim
#git clone --recurse-submodules https://github.com/vtex-lab/karpenter-research.git

# Cleanup and finish
echo "All requested software has been installed. Please restart your terminal or run 'source ~/.bashrc' to apply changes."


