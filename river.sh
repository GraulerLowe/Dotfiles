#!/bin/bash

user="$HOME"

install_dependencies() {
    if [ -x "$(command -v pacman)" ]; then
        echo -e "[*] Instalando paquetes usando pacman."
        sudo pacman --noconfirm --needed -S river fuzzel nemo foot github-cli waybar webp-pixbuf-loader mako brightnessctl pactl ttf-jetbrains-mono ttf-fira-code 
    elif [ -x "$(command -v dnf)" ]; then 
        echo -e "[*] Instalando paquetes usando dnf"
        sudo dnf install -y hyprland rofi nemo kitty gh waybar emacs 
    else
        echo -e "[*] FALLO LA INSTALACION DEL PAQUETES: No se encontro el gestor de paquetes. Debes instalar los paquetes de forma manual." >&2
    fi
}

copy_directory() {
    echo -e "[*] Copiando los archivos en .config"

    declare -a dirs=("waybar" "foot" "river" "fuzzel")

    for dir in "${dirs[@]}"; do
        src="$user/Arch_linux/River/$dir"
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

while true; do
    clear
    echo -e "Script para la instalacion del gestor de ventanas River"
    echo -e "[*] Elige la opcion:"
    echo -e "1. Instalar los paquetes."
    echo -e "2. Copiar los archivos."
    echo -e "3. Exit."
    read -p "[*] Your choice: " x
     
    case $x in
        [1]* ) install_dependencies; exit;;
        [2]* ) copy_directory; nerd_fonts_manuall; exit;;
        [3]* ) exit;;
    esac
done
