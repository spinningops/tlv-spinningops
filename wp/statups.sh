#!/bin/bash

echo "updating unprivileged_port 80"
echo "net.ipv4.ip_unprivileged_port_start=80" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p
echo "enable linger"
loginctl enable-linger $USER
echo "starting podman-compose"
podman-compose up -d