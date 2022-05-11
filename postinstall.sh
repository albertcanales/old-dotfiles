#!/bin/bash

user="albert"

# Additionally the following packages are installed on Appimages 
# due to faulty pacman or yay packages
# Joplin, Nextcloud Client 

SYSTEM_PAC=(
    base-devel
    cmake
    yay
    neofetch
    neovim neovim-plug
    stow
    bspwm
    sxhkd
    rofi
    picom
    dunst ttf-roboto ttf-roboto-mono
    stalonetray # Necessary for polybar
    brightnessctl
    xorg-xinput
    flameshot
    feh
    pcmanfm ffmpegthumbnailer
    xdotool # for moving mouse
    dateutils # oneliners for dates
    arandr # gui for xrandr
    playerctl
    ttf-jetbrains-mono
    xf86-input-wacom
    lxappearance
    network-manager-applet
    wireguard-tools
    kitty
    bat
    most
    lsd
    strace
)

SYSTEM_AUR=(
    betterlockscreen
    polybar-git # Necessary as long as release version is < 3.5.6
    dmenufm
)

PROG_PAC=(
    arduino arduino-avr-code
    audacity
    discord
    gimp
    pinta
    simplescreenrecorder
    xournalpp
    zhatura zhathura-pdf-mupdf
    cheese
    virt-manager qemu vde2 ebtables dnsmasq bridge-utils openbsd-netcat
    bitwarden
    pdfjam
    gparted
    transmission-gtk
    telegram
    ventoy 
    brave-browser
    doxygen
    calibre
)

PROG_AUR=(
    android-studio
    cadmus
    joplin-desktop
    sublime-text-4
    todoist-electron
    whatsapp-nativefier-dark
    google-calendar-nativefier
    marktext
)



function intro {
    echo "==> Indicate the parts of installation you want to SKIP"
    echo "1  Pacman system packages"
    echo "2  Yay system packages"
    echo "3  Pacman program packages"
    echo "4  Yay program packages"
    read -p "==> " skipped
}

function set_user {
    local answer
    read -p "Non-root user is set as '$user', continue? [Y/n] " answer
    [[ $answer == [Nn] || answer == [Nn][Oo] ]] && exit 1
}

# Recieves the installer and array of packages
function installer() {
    local manager=$1
    shift
    for package in "$@"; do
        echo "Installing $package with $manager"
        if [[ $manager == "pacman" ]]; then
            pacman -S --noconfirm $package
        elif [[ $manager == "yay" ]]; then
            if yay --version > /dev/null; then
                sudo -u $user yay -S --noconfirm $package
            else
                echo "ERROR: yay is not installed!! Install it from pacman or add it into SYSTEM_PAC"
            fi
        fi
    done
}

if [ $EUID -ne 0 ]; then
   echo "This script must be run as root"
   exit 1
fi
set_user

intro
echo $skipped

[[ -z $(echo $skipped | grep 1) ]] &&
    installer pacman "${SYSTEM_PAC[@]}"

[[ -z $(echo $skipped | grep 2) ]] &&
    installer yay "${SYSTEM_AUR[@]}"

[[ -z $(echo $skipped | grep 3) ]] &&
    installer pacman "${PROG_PAC[@]}"

[[ -z $(echo $skipped | grep 4) ]] &&
    installer yay "${PROG_AUR[@]}"


