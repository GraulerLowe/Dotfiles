#!/bin/bash

user="$HOME"

install_dependencies() {
    if [ -x "$(command -v pacman)" ]; then
        echo -e "[*] Instalando paquetes usando pacman."
        sudo pacman --noconfirm --needed -S hyprland rofi nemo kitty github-cli waybar emacs libwebp
    elif [ -x "$(command -v dnf)" ]; then 
        echo -e "[*] Instalando paquetes usando dnf"
        sudo dnf install -y hyprland rofi nemo kitty gh waybar emacs 
    else
        echo -e "[*] FALLO LA INSTALACION DEL PAQUETES: No se encontro el gestor de paquetes. Debes instalar los paquetes de forma manual." >&2
    fi
}

copy_directory() {
    echo -e "[*] Copiando los archivos en .config"

    declare -a dirs=("hypr" "waybar" "wofi" "kitty")

    for dir in "${dirs[@]}"; do
        src="$user/Arch_linux/$dir"
        dst="$user/.config/$dir"

        if [ -d "$src" ]; then
            mkdir -p "$dst"
            cp -r "$src/." "$dst"
            echo "[*] Copiados archivos de $src a $dst"
        else
            echo "[!] Carpeta de origen $src no existe, omitiendo."
        fi
    done
}

while true; do
    clear
    echo -e "Script para la instalacion del gestor de ventanas hyprland"
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
