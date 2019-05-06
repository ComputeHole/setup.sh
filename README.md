# setup.sh
*only tested on Ubuntu 19.04 but should theoretically work on any Ubuntu system*

## how to use
```
wget https://raw.githubusercontent.com/ComputeHole/setup.sh/master/setup.sh
chmod +x setup.sh
sudo ./setup.sh
```

## what this does

[setup.sh](setup.sh) will install and configure [Pi-hole](https://github.com/pi-hole/pi-hole), [unbound](https://nlnetlabs.nl/projects/unbound/about/), and [pivpn](https://github.com/pivpn/pivpn) on your Ubuntu machine (real metal or VM).

When [setup.sh](setup.sh) is finished you should be left with working version of [Pi-hole & pivpn on Google Compute Engine](https://github.com/ComputeHole/pi-hole-pivpn-compute-engine) with both split and full tunnels configured on port 80 and 443 respectively.
