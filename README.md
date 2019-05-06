# setup.sh

*only tested on Ubuntu 19.04 but should theoretically work on any Ubuntu system*

## how to use

```
wget https://raw.githubusercontent.com/ComputeHole/setup.sh/master/setup.sh
chmod +x setup.sh
sudo ./setup.sh
```

## what this does

[setup.sh](setup.sh) will install and configure [Pi-hole](https://pi-hole.net), [unbound](https://nlnetlabs.nl/projects/unbound/about/), and [pivpn](https://pivpn.io) on your Ubuntu machine (real metal or VM).

### configuration details

 * Pi-hole will use unbound on ```127.0.0.1#5353``` && ```::1#5353```
 
 * openVPN will be configured as a split tunnel (only DNS traffic) on ```Pu.bl.ic.ip:80``` with subnet ```10.80.0.x```
 
 * openVPN will be configured as a full tunnel on ```Pu.bl.ic.ip:443``` with subnet ```10.4.43.x```
