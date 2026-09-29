#!/bin/bash
SUBNET_SRC=$1
SUBNET_DST=$2

echo "Bloqueando enrutamiento entre la subred $SUBNET_SRC y la subred $SUBNET_DST..."

# Insertar regla DROP para denegar el tráfico entre ambas subredes
sudo iptables -I FORWARD 1 -s $SUBNET_SRC -d $SUBNET_DST -j DROP
sudo iptables -I FORWARD 1 -s $SUBNET_DST -d $SUBNET_SRC -j DROP

echo "¡Enrutamiento bloqueado con éxito entre las subredes!"
