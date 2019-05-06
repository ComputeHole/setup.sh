#!/usr/bin/env bash
# shellcheck disable=SC1090

echo "making directory ~/setup.sh"
mkdir ~/setup.sh
echo "change to ~/setup.sh"
cd ~/setup.sh
echo "Download https://install.pi-hole.net"
wget https://install.pi-hole.net -O install.pi-hole.net
echo "Download https://install.pivpn.io"
wget https://install.pivpn.io -O install.pivpn.io
echo "making scripts executable"
sudo chmod +x install.pi-hole.net
sudo chmod +x install.pivpn.io

echo "setup repos"
sudo wget -O - https://swupdate.openvpn.net/repos/repo-public.gpg|apt-key add -
sudo echo "deb http://build.openvpn.net/debian/openvpn/release/2.4 bionic main" > /etc/apt/sources.list.d/openvpn-aptrepo.list
sudo add-apt-repository ppa:ondrej/apache2 -y
sudo add-apt-repository ppa:ondrej/php -y
sudo wget https://dev.mysql.com/get/mysql-apt-config_0.8.13-1_all.deb
sudo dpkg -i mysql-apt-config_0.8.13-1_all.deb

sleep 5s

echo "Updating package cache"
sudo apt update

sleep 5s

echo "Upgrading available packages"
sudo apt upgrade

sleep 5s

echo "installing and confirgure dependencies"
sudo apt install apt-utils dialog debconf dhcpcd5 git cron curl dnsutils iputils-ping lsof netcat psmisc unzip wget idn2 sqlite3 libcap2-bin dns-root-data resolvconf libcap2 iproute2 php7.2-common php7.2-cgi php7.2-sqlite3 apache2 libapache2-mod-php7.2 openvpn iptables-persistent dnsutils expect whiptail net-tools

sleep 1s

sudo a2enmod php7.2
sudo service apache2 restart

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
