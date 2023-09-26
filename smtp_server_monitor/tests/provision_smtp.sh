
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y postfix
sudo apt install mailutils
sudo apt install original-awk 2012-12-20-6

# Configure Postfix for local delivery only (replace with your desired config)
sudo postconf -e "mydestination = localhost"
sudo service postfix restart