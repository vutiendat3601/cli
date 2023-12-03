#!/bin/bash

# ## Update the apt package index and install packages to allow apt to use a repository over HTTPS:
apt update;
apt install ca-certificates curl gnupg -y;

# ## Add Docker’s official GPG key:
install -m 0755 -d /etc/apt/keyrings;
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg;
chmod a+r /etc/apt/keyrings/docker.gpg;

# ## Use the following command to set up the repository:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null;
# ## Update the apt package index
apt update;

# ## Install Docker Engine, containerd, and Docker Compose.
apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y;

