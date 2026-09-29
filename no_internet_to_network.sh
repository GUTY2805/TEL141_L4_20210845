#!/bin/bash
SUBNET=$1
PHYSICAL_NIC=$2

echo "Bloqueando salida a Internet para la subred $SUBNET por la interfaz $PHYSICAL_NIC..."

# Insertar regla DROP para denegar el tráfico saliente hacia la interfaz física desde la subred
sudo iptables -t nat -D POSTROUTING -s $SUBNET -o $PHYSICAL_NIC -j MASQUERADE 2>/dev/null
sudo iptables -I FORWARD 1 -s $SUBNET -o $PHYSICAL_NIC -j DROP

echo "¡Salida a Internet bloqueada con éxito para la subred $SUBNET!"

