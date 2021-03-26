#!/bin/bash

: '
    Arch Linux Install Script: Part 2

    Author: jmpargana aka icm
    Email: jmpargana@gmail.com

    Should be run after finishing `Part 1` script
    and entering remote root with: `arch-chroot /mnt`
'



echo "### Set Date Time"
ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
hwlock --systohc



echo "### Set Locale"
sed -i '/en_US.UTF-8 UTF-8/s/^#//g' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf



echo "### Set Hostname"
echo arch > /etc/hostname
cat >> /etc/hosts <<EOF
127.0.0.1   localhost
::1         localhost
127.0.1.1   arch.localdomain   arch
EOF



echo "### Generate initramfs"
mkinitcpio -P



echo "### Automatically update time"
systemctl enable --now systemd-timesyncd.service
hwclock -w


echo "### Create root password"
passwd
echo "### Create user"
useradd -m -G wheel,power,storage -s /bin/bash icm
sed --in-place 's/^#\s*\(%wheel\s\+ALL=(ALL)\s\+NOPASSWD:\s\+ALL\)/\1/' /etc/sudoers
passwd icm




echo "### Setup bootloader"
bootctl install
cat > /boot/loader/loader.conf <<EOF
default arch-uefi
timeout 0
EOF

cat > /boot/loader/entries/arch-uefi.conf
title   Arch Linux
linux   /vmlinuz-linux
initrd  /intel-ucode.img
initrd  /initramfs-linux.img
options root=LABEL=p_arch rw resume=LABEL=p_swap quiet loglevel=3 rd.udev.log_priority=3
EOF

cat > /boot/loader/entries/arch-uefi-fallback.conf
title   Arch Linux Fallback
linux   /vmlinuz-linux
initrd  /intel-ucode.img
initrd  /initramfs-linux-fallback.img
options root=LABEL=p_arch rw resume=LABEL=p_swap quiet loglevel=3 rd.udev.log_priority=3
EOF




AUR_PACKAGES="
    neovim-git
    mongodb-compass
    postman-bin
    netextender
    nvm"

PACKAGES="
    acpi
    acpid 
    alacritty 
    alsa-firmware 
    alsa-utils 
    audacious 
    b43-fwcutter 
    bat 
    bash-completion
    blueman 
    bluez-utils 
    brightnessctl 
    ctags 
    dhcpcd 
    dialog
    docker 
    dosfstools 
    e2fsprogs 
    efibootmgr 
    exa 
    exfat-utils 
    fd 
    firefox 
    gcc 
    gedit 
    gnome-keyring 
    go 
    gparted 
    gufw 
    i3status-rust 
    intel-ucode 
    keepassxc 
    less 
    lxappearance 
    mako 
    man-db 
    man-pages 
    netctl 
    networkmanager 
    networkmanager-openconnect 
    networkmanager-openvpn 
    nm-connection-editor
    noto-fonts 
    openssh 
    os-prober 
    papirus-maia-icon-theme 
    pavucontrol 
    powerline 
    powerline-fonts 
    pulseaudio-bluetooth 
    pulseaudio-ctl 
    python-pip 
    ripgrep 
    sway 
    swayidle 
    swaylock 
    telegram-desktop 
    texinfo 
    thunar 
    thunderbird 
    tmux 
    tree 
    transmission-gtk
    ttf-dejavu 
    ttf-droid 
    ttf-font-awesome 
    ttf-font-icons 
    ttf-inconsolata 
    ttf-indic-otf 
    ttf-ionicons 
    ttf-liberation 
    usbutils 
    vim 
    vlc 
    wget 
    wofi 
    wpa_supplicant 
    xclip
    yay
    git"


echo "### Installing all pacman packages"
yes | sudo pacman -S $PACKAGES


echo "### Setting up yay"
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd


echo "### Installing AUR packages"
yes | yay -S $AUR_PACKAGES


echo "### Load Config files"
cd /home/icm
export HOME=/home/icm
git init --base ~/.dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
config remote add origin https://github.com/jmpargana/dotfiles.git
config pull
