#!/bin/bash
echo "Inicializando nodo Master..."

# Actualizar configuraciones básicas o asegurar servicios de red
sudo sysctl -w net.ipv4.ip_forward=1

# Asegurar que Open vSwitch esté activo
sudo systemctl enable openvswitch-switch
sudo systemctl start openvswitch-switch

echo "¡Nodo Master inicializado correctamente!"
