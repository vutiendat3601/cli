#!/bin/bash

# ## Set up Docker's Apt repository
apt update;
apt install ca-certificates curl gnupg -y;
install -m 0755 -d /etc/apt/keyrings;
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg;
echo \
	"deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
	 "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
	tee /etc/apt/sources.list.d/docker.list > /dev/null;
apt update;

# ## Install the Docker packages
apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y;

