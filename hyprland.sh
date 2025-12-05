#!/bin/bash

user="$HOME"

install_dependencies() {
    if [ -x "$(command -v pacman)" ]; then
        echo -e "[*] Instalando paquetes usando pacman."
        sudo pacman --noconfirm --needed -S hyprland wofi kitty github-cli waybar mako webp-pixbuf-loader swaybg brightnessctl \
            dolphin swaylock playerctl pipewire wireplumber pipewire-pulse \
            xdg-desktop-portal xdg-desktop-portal-hyprland lxqt-policykit \
            grim emacs thunderbird evince

        echo "[*] Instalando temas de Rofi..."
        rofi_theme_selector

    elif [ -x "$(command -v dnf)" ]; then 
        echo -e "[*] Instalando paquetes usando dnf"
        sudo dnf install -y hyprland wofi kitty gh waybar mako swaybg brightnessctl \
            dolphin swaylock playerctl pipewire pipewire-pulseaudio wireplumber \
            xdg-desktop-portal xdg-desktop-portal-hyprland lxqt-policykit \
            grim emacs thunderbird flatpak evince

    else
        echo -e "[*] FALLO LA INSTALACION DE PAQUETES: No se encontró el gestor de paquetes. Debes instalar los paquetes de forma manual." >&2
    fi
}


nerd_fonts_manuall (){
    echo -e "[*] Instalando fuentes de nerd fonts de forma manual"
    curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/FiraCode.zip
    curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/NerdFontsSymbolsOnly.zip
    mkdir -p ~/.local/share/fonts
    unzip FiraCode.zip -d ~/.local/share/fonts
    unzip NerdFontsSymbolsOnly.zip -d ~/.local/share/fonts
    echo "[*] Actualizando caché de fuentes..."
    fc-cache -fv
    rm FiraCode.zip
    rm NerdFontsSymbolsOnly.zip
    echo "[*] Se han instalado las fuentes de texto correspodientes. Si es necesario reinicia el equipo"
}

copy_directory() {
    echo -e "[*] Copiando los archivos en .config"

    declare -a dirs=("waybar" "kitty" "hypr" "wofi")

    for dir in "${dirs[@]}"; do
        src="$user/Arch_linux/hyprland/$dir"
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
        [1]* ) install_dependencies; nerd_fonts_manuall; exit;;
        [2]* ) copy_directory; exit;;
        [3]* ) exit;;
    esac
done
