# Dotfiles
Este repositorio contiene mi configuracion de Hyprland disponible para los sistemas operativos basados en linux con el gestor de paquetes pacman, apt y dnf. Como forma experimental se tiene para gentoo (emerge).
### Instalación
Solo debes ejecutar el archivo hyprland.sh. En caso de fallar el script y de haber instalado las dependencias de hyrpland por tu cuenta, puedes copiar cada carpeta de forma manual.
Si lo prefieres, ejecuta el archivo hyprland_zenity.sh el cual permite una instalacíon de forma gráfica. Para ello debes tener instalado zenity, aunque por lo general ya viene instalado en la mayoria de las distribuciones linux, en el caso de gentoo, solo debes ejecutar:

```
sudo emerge -q gnome-extra/zenity
```
### Aviso
La versión actual del instalador de gentoo (no integrado a zenity) funciona correctamente y puedes instalarla de forma adecuada, solo ten en cuenta que se esta suponiendo que eres un usuario de gentoo completo, lo que implica que te gusta tener tu sistema solo con lo que ocupas. Este script modifica USE flags e instalar cosas que puede que no uses o incluso no sean de tu agrado. Aqui las dependencias a instalarse en gentoo:
```
 gui-libs/hyprland \                                                                                                               
 gui-apps/hyprpaper \                                                                                                              
 gui-apps/hyprlock \                                                                                                               
 gui-apps/hypridle \                                                                                                               
 x11-terms/kitty \                                                                                                                 
 app-misc/waybar \                                                                                                                 
 gui-apps/mako \                                                                                                                   
 gui-libs/hyprtoolkit  \                                                                                                           
 media-fonts/nerd-fonts  
```
Si alguna no es de tu agrado puedes remplazarla o simplemente usa las carpetas para copiarlas de forma manual.
## Hyprland
La configuracion incluye el gestor de ventanas hyprland configura la barra de estado waybar junto a las aplicaciones que yo ocupo para mi trabajo diario como 
desarrollador y programador. Si deseas no usar estas aplicaciones deberas cambiarlas de forma manual.
<img width="1366" height="768" alt="gentoo_1" src="https://github.com/user-attachments/assets/64b0585e-8843-41a5-abee-0f301f0c0d1d" />
<img width="1366" height="768" alt="gentoo_2" src="https://github.com/user-attachments/assets/442b6a48-c55f-430f-a957-c780bfaa52a0" />
<img width="1366" height="768" alt="gentoo_3" src="https://github.com/user-attachments/assets/f7552053-89a7-45cb-99b7-cba8841e1bda" />




