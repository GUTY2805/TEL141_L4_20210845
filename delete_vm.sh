#!/bin/bash
VM_NAME=$1

echo "Eliminando / desconectando la máquina virtual o contenedor $VM_NAME..."

# Limpieza de interfaces o recursos asociados a la VM/contenedor
if ip link show $VM_NAME &> /dev/null; then
    sudo ip link delete $VM_NAME
    echo "Interfaz de $VM_NAME eliminada."
else
    echo "No se encontró una interfaz activa para $VM_NAME."
fi

echo "¡VM o contenedor $VM_NAME eliminado con éxito!"
