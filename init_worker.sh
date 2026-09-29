#!/bin/bash
echo "Inicializando nodo Worker..."

# Habilitar IP Forwarding y asegurar servicios necesarios en el nodo worker
sudo sysctl -w net.ipv4.ip_forward=1
sudo systemctl enable openvswitch-switch
sudo systemctl start openvswitch-switch

echo "¡Nodo Worker inicializado correctamente!"

