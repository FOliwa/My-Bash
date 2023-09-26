The thing is - I will setup posfix for use in a local private network with Linxux machines. 
It will be kind of private email system for tests. 
I will use Postfix to get and send email over this private network.

Prerequisites:
1. Ensure that each Linux machine in your local private network has a unique hostname.
2. Make sure that all Linux machines in your network have Postfix installed. 

Steps to Set Up Postfix in a Local Private Network
1. Configure the Hostname - set a unique hostname
    sudo nano /etc/hostname
2. Edit Postfix Configuration
    - myhostname: Set this to the hostname of the machine. 
      EXAMPLE: myhostname = machine1.local
    - mydomain: Set this to the local domain name for your network:
      EXAMPL: mydomain = local
