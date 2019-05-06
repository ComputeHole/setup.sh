#!/usr/bin/env bash
# shellcheck disable=SC1090

echo "changing to ~setup.sh"
mkdir ~/setup.sh
cd ~/setup.sh
echo "Download https://install.pi-hole.net"
wget https://install.pi-hole.net -O install.pi-hole.net
echo "Download https://install.pivpn.io"
wget https://install.pivpn.io -O install.pivpn.io
echo "making scripts executable"
sudo chmod +x install.pi-hole.net
sudo chmod +x install.pivpn.io

sleep 5s

echo "Updating package cache"
sudo apt update

sleep 5s

echo "Upgrading available packages"
sudo apt upgrade

sleep 5s

echo "Installing Pi-hole"
sudo ./install.pi-hole.net

sleep 5s

echo "installing unbound on localhost port 5353"
sudo apt install unbound
sleep 3s
sudo wget https://www.internic.net/domain/named.root -O /var/lib/unbound/root.hints
sleep 2s
sudo wget https://raw.githubusercontent.com/ComputeHole/setup.sh/master/pi-hole.conf -O /etc/unbound/unbound.conf.d/pi-hole.conf
sudo service unbound start

sleep 5s

echo "making pi-hole use local unbound instance"
sudo sed -i 's/^PIHOLE_DNS_1=.*/PIHOLE_DNS_1=127.0.0.1#5353/' /etc/pihole/setupVars.conf
sudo sed -i 's/^PIHOLE_DNS_2=.*/PIHOLE_DNS_2=::1#5353/' /etc/pihole/setupVars.conf

sleep 5s

echo "Installing pivpn"
sudo ./install.pivpn.io

sleep 5s
