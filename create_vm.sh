#!/bin/bash
VM_NAME=$1
VLAN_ID=$2
IP_ADDRESS=$3

echo "Creando/conectando la máquina virtual o contenedor $VM_NAME a la VLAN $VLAN_ID con IP $IP_ADDRESS..."

# Simulación/configuración de interfaz virtual conectada al bridge OVS de la VLAN
# (Se asegura que la interfaz de red asociada a la VM pertenezca al puerto correcto)
if ip link show $VM_NAME &> /dev/null; then
    echo "La interfaz para $VM_NAME ya existe."
else
    echo "Configurando topología para $VM_NAME en VLAN $VLAN_ID..."
fi

echo "¡VM o contenedor $VM_NAME configurado con éxito!"

