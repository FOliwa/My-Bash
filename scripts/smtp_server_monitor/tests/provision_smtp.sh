sudo apt update
sudo apt install postfix -y
sudo cp /etc/postfix/main.cf.proto /etc/postfix/main.cf

posfix_conf="/etc/postfix/main.cf"
echo "mailbox_size_limit = 0" | sudo tee -a $posfix_conf
echo "recipeint_delimeter_value = +" | sudo tee -a $posfix_conf
echo "inet_interface_value = loopback-only" | sudo tee -a $posfix_conf

sudo systemctl enable postfix
sudo systemctl start posfix

