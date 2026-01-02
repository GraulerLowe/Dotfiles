#!/bin/bash

user="$HOME"

#Funciones y Métodos

install_dependencies() {
    if [ -x "$(command -v pacman)" ]; then
        echo -e "[*] Instalando paquetes usando pacman."
        sudo pacman --noconfirm --needed -S hyprland wofi kitty github-cli waybar mako webp-pixbuf-loader swaybg brightnessctl \
            dolphin swaylock playerctl pipewire wireplumber pipewire-pulse \
            xdg-desktop-portal xdg-desktop-portal-hyprland lxqt-policykit \
            grim emacs thunderbird evince zenity

        echo "[*] Instalando temas de Rofi..."
        rofi_theme_selector

    elif [ -x "$(command -v dnf)" ]; then 
        echo -e "[*] Instalando paquetes usando dnf"
        sudo dnf install -y hyprland wofi kitty gh waybar mako swaybg brightnessctl \
            dolphin swaylock playerctl pipewire pipewire-pulseaudio wireplumber \
            xdg-desktop-portal xdg-desktop-portal-hyprland lxqt-policykit \
            grim emacs thunderbird flatpak evince zenity

    else
        echo -e "[*] FALLO LA INSTALACION DE PAQUETES: No se encontró el gestor de paquetes. Debes instalar los paquetes de forma manual." >&2
    fi
}


nerd_fonts_manuall (){
    zenity --info --text="[*] Instalando fuentes de nerd fonts de forma manual" --width=250
    curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/FiraCode.zip
    curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/NerdFontsSymbolsOnly.zip
    mkdir -p ~/.local/share/fonts
    unzip FiraCode.zip -d ~/.local/share/fonts
    unzip NerdFontsSymbolsOnly.zip -d ~/.local/share/fonts
    zenity --info --text="[*] Actualizando caché de fuentes..." --width=250
    fc-cache -fv
    rm FiraCode.zip
    rm NerdFontsSymbolsOnly.zip
    zenity --info --text="[*] Se han instalado las fuentes de texto correspodientes. Si es necesario reinicia el equipo" --width=250
}

copy_directory() {
    echo -e "[*] Copiando los archivos en .config"

    declare -a dirs=("waybar" "kitty" "hypr" "wofi")

    for dir in "${dirs[@]}"; do
        src="$user/Dotfiles/hyprland/$dir"
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
    choice=$(zenity --question \
                    --title="Instalador de Dotfiles" \
                    --text="Script para la instalación del gestor de ventanas Hyprland\n\n[*] Elige la opción:" \
                    --width=400 \
                    --ok-label="Instalar paquetes" \
                    --cancel-label="Salir" \
                    --extra-button="Copiar archivos")
    
    respuesta=$?
    
    if [ $respuesta -eq 0 ]; then
        zenity --info --text="Instalando paquetes..." --width=250
        nerd_fonts_manuall;
        
    elif [ $respuesta -eq 1 ]; then
        if [ "$choice" = "Copiar archivos" ]; then
            zenity --info --text="Copiando archivos..." --width=250
            copy_directory;
        else
            zenity --info --text="Saliendo..." --width=250
            break
        fi
    fi
done
