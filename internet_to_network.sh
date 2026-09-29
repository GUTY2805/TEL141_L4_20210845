#!/bin/bash
SUBNET=$1
PHYSICAL_NIC=$2

echo "Habilitando salida a Internet para la subred $SUBNET por la interfaz $PHYSICAL_NIC..."

# Habilitar IP Forwarding
sudo sysctl -w net.ipv4.ip_forward=1

# Reglas de NAT y Forwarding con iptables
sudo iptables -t nat -A POSTROUTING -s $SUBNET -o $PHYSICAL_NIC -j MASQUERADE
sudo iptables -A FORWARD -s $SUBNET -j ACCEPT
sudo iptables -A FORWARD -d $SUBNET -j ACCEPT

echo "¡Salida a Internet habilitada con éxito!"
