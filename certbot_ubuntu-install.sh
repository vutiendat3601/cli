apt install -y snapd;
snap install core;
snap install --classic certbot;
ln -s /snap/bin/certbot /usr/bin/certbot;
