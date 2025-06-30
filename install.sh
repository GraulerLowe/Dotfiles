#!/bin/bash

user="$HOME"

install_dependencies() {
    if [ -x "$(command -v pacman)" ]; then
        echo -e "[*] Instalando paquetes usando pacman."
        sudo pacman --noconfirm --needed -S sway wofi nemo kitty github-cli waybar emacs lxqt-policykit
    elif [ -x "$(command -v dnf)" ]; then 
        echo -e "[*] Instalando paquetes usando dnf"
        sudo dnf install -y sway wofi nemo kitty gh waybar lxqt-policykit emacs 
    else
        echo -e "[*] FALLO LA INSTALACION DEL PAQUETES: No se encontro el gestor de paquetes. Debes instalar los paquetes de forma manual." >&2
    fi
}

copy_directory() {
    echo -e "[*] Copiando los archivos en .config"
    [ -d "$user/.config/sway" ] && cp -r "$user/Arch_linux/sway/*" "$user/.config/sway"
    [ -d "$user/.config/waybar" ] && cp -r "$user/Arch_linux/waybar/*" "$user/.config/waybar"
    [ -d "$user/.config/wofi" ] && cp -r "$user/Arch_linux/wofi/*" "$user/.config/wofi"
    [ -d "$user/.config/kitty" ] && cp -r "$user/Arch_linux/kitty/*" "$user/.config/kitty"
}

while true; do
    clear
    echo -e "Script para la instalacion del gestor de ventanas Sway"
    echo -e "[*] Elige la opcion:"
    echo -e "1. Instalar los paquetes."
    echo -e "2. Copiar los archivos."
    echo -e "3. Exit."
    read -p "[*] Your choice: " x
     
    case $x in
        [1]* ) install_dependencies; exit;;
        [2]* ) copy_directory; exit;;
        [3]* ) exit;;
    esac
done
