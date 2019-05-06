#!/usr/bin/env bash
# shellcheck disable=SC1090

echo "Updating package cache"
sudo apt update && sudo apt upgrade

sleep 5s

echo "Installing Pi-hole"
curl -sSL https://install.pi-hole.net | bash

sleep 5s

echo "Installing pivpn"
curl -L https://install.pivpn.io | bash
