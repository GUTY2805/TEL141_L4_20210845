#!/bin/bash
VLAN_ID=$1
SUBNET=$2
GATEWAY_IP=$3

echo "Configurando VLAN $VLAN_ID con subred $SUBNET y gateway $GATEWAY_IP..."

# 1. Asegurar que existe el bridge OVS 'br-int'
if ! sudo ovs-vsctl br-exists br-int; then
    sudo ovs-vsctl add-br br-int
    echo "Bridge br-int creado."
fi

# 2. Crear interfaz interna para el Gateway de la VLAN si no existe
if ! ip link show vlan$VLAN_ID &> /dev/null; then
    sudo ip link add link br-int name vlan$VLAN_ID type vlan id $VLAN_ID
    sudo ip addr add $GATEWAY_IP dev vlan$VLAN_ID
    sudo ip link set dev vlan$VLAN_ID up
    echo "Interfaz VLAN $VLAN_ID creada con IP $GATEWAY_IP"
fi

# 3. Habilitar IPv4 forwarding y Masquerading (Salida a Internet)
sudo sysctl -w net.ipv4.ip_forward=1
sudo iptables -t nat -A POSTROUTING -s $SUBNET -o ens3 -j MASQUERADE
sudo iptables -A FORWARD -s $SUBNET -j ACCEPT
sudo iptables -A FORWARD -d $SUBNET -j ACCEPT

echo "¡Configuración de la Actividad 1 aplicada con éxito!"
