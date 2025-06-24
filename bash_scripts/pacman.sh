#!/bin/bash

read -p "Escribe actual para actualizar tu equipo: " modi

if [ "$modi" = "actual" ]; then
	sudo dnf update
	sudo dnf upgrade
    neofetch
	echo "Actualizado"
else 
	echo "No se reconoce lo escrito"
	exit
fi
