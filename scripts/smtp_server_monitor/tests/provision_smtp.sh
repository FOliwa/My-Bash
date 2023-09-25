
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y postfix

# Configure Postfix for local delivery only (replace with your desired config)
sudo postconf -e "mydestination = localhost"
sudo service postfix restart