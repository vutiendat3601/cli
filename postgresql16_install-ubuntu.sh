apt update -y
echo 'deb http://apt.postgresql.org/pub/repos/apt bookworm-pgdg main' > /etc/apt/sources.list.d/pgdg.list
curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/postgresql.gpg
apt update
apt install postgresql-16 postgresql-contrib-16
systemctl start postgresql
systemctl enable postgresql
