c# Get Environment Variables
USER=$1
VMNAME=$2

# Create .profile script
touch /home/$USER/.bash_profile
chmod +x /home/$USER/.bash_profile

cat <<EOT > /home/$USER/.bash_profile
#!/bin/bash
##Environment Variables
export VMNAME=$VMNAME

## Configure Ubuntu to allow Azure Arc Connected Machine Agent Installation 

echo "Configuring walinux agent"
sudo service walinuxagent stop
sudo waagent -deprovision -force
sudo rm -rf /var/lib/waagent

echo "Configuring Firewall"

sudo ufw --force enable
sudo ufw deny out from any to 169.254.169.254
sudo ufw default allow incoming
sudo apt-get update

echo "Reconfiguring Hostname"

sudo hostname $VMNAME
sudo -E /bin/sh -c 'echo $VMNAME > /etc/hostname'

rm -f /home/$USER/.bash_profile

EOT
