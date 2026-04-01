#!/bin/bash

user="$HOME"

install_dependencies() {
    if [ -x "$(command -v pacman)" ]; then
        echo -e "[*] Instalando paquetes usando pacman."
        sudo pacman --noconfirm --needed -S hyprland wofi kitty github-cli waybar mako webp-pixbuf-loader swaybg brightnessctl \
            thunar swaylock playerctl pipewire wireplumber pipewire-pulse \
            xdg-desktop-portal xdg-desktop-portal-hyprland lxqt-policykit \
            grim emacs

    elif [ -x "$(command -v dnf)" ]; then 
        echo -e "[*] Instalando paquetes usando dnf"
        sudo dnf install -y hyprland wofi kitty gh waybar mako swaybg brightnessctl \
            thunar swaylock playerctl pipewire pipewire-pulseaudio wireplumber \
            xdg-desktop-portal xdg-desktop-portal-hyprland lxqt-policykit \
            grim emacs thunderbird flatpak evince
    elif [-x "$(command -v apt)"]; then
        echo -e "[*] Instalando paquetes usando dnf"
        sudo apt update && sudo apt upgrade && sudo apt hyprland wofi kitty gh waybar mako swaybg brightnessctl \
            thunar swaylock playerctl pipewire pipewire-pulseaudio wireplumber \
            xdg-desktop-portal xdg-desktop-portal-hyprland lxqt-policykit \
            grim emacs
    elif [-x "$(command -v emerge)"]; then
        echo -e "[*] Instalando paquetes usando emerge. Ten en cuenta que esto puede tardar horas dependiendo de la compilacion de cada paquete."
        sudo eselect repository enable guru
        sudo emerge --sync

        echo "Configurando USE flags"
        touch /etc/portage/package.use/hyprland
        cat > /etc/portage/package.use/hyprland << EOF
        gui-libs/hyprland X wayland aqua libinput
        dev-libs/wayland X
        media-libs/mesa wayland
        gui-libs/wlroots X wayland
        EOF

        echo "Configurando keywords (~amd64)"
        mkdir -p /etc/portage/package.accept_keywords
        touch /etc/portage/package.accept_keywords/hyprland
        cat > /etc/portage/package.accept_keywords/hyprland << EOF
        gui-libs/hyprland ~amd64
        dev-libs/wayland ~amd64
        gui-libs/wlroots ~amd64
        EOF

        echo "Instalando dependencias"
        sudo emerge --ask --verbose \
               gui-libs/hyprland \
               gui-apps/hyprpaper \
               gui-apps/hyprlock \
               gui-apps/hypridle \
               x11-terms/kitty \
               app-misc/waybar \
               gui-apps/mako \
               gui-libs/hyprtoolkit  \
               media-fonts/nerd-fonts
    else
        echo -e "[*] FALLO LA INSTALACION DE PAQUETES: No se encontró el gestor de paquetes. Debes instalar los paquetes de forma manual." >&2
    fi
}


nerd_fonts_manuall (){
    echo -e "[*] Instalando fuentes de nerd fonts de forma manual"
    curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/FiraCode.zip
    curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/NerdFontsSymbolsOnly.zip
    curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Ubuntu.zip
    curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/UbuntuMono.zip
    mkdir -p ~/.local/share/fonts
    unzip FiraCode.zip -d ~/.local/share/fonts
    unzip Ubuntu.zip -d ~/.local/share/fonts
    unzip UbuntuMono.zip -d ~/.local/share/fonts
    unzip NerdFontsSymbolsOnly.zip -d ~/.local/share/fonts
    echo "[*] Actualizando caché de fuentes..."
    fc-cache -fv
    rm FiraCode.zip
    rm NerdFontsSymbolsOnly.zip
    rm Ubuntu.zip
    rm UbuntuMono.zip
    echo "[*] Se han instalado las fuentes de texto correspodientes. Si es necesario reinicia el equipo"
}

copy_directory() {
    echo -e "[*] Copiando los archivos en .config"

    declare -a dirs=("waybar" "kitty" "hypr" "wofi" "hyprlock")

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
