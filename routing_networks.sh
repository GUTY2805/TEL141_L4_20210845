#!/bin/bash
SUBNET_SRC=$1
SUBNET_DST=$2

echo "Habilitando enrutamiento entre la subred $SUBNET_SRC y la subred $SUBNET_DST..."

# Asegurar IP Forwarding activo
sudo sysctl -w net.ipv4.ip_forward=1

# Permitir tráfico forward entre ambas subredes
sudo iptables -A FORWARD -s $SUBNET_SRC -d $SUBNET_DST -j ACCEPT
sudo iptables -A FORWARD -s $SUBNET_DST -d $SUBNET_SRC -j ACCEPT

echo "¡Enrutamiento entre subredes habilitado con éxito!"
