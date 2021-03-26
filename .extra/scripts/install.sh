#!/bin/bash

: '
    Arch Linux Install Script: Part 2

    Author: jmpargana aka icm
    Email: jmpargana@gmail.com

    Should be run after finishing `Part 1` script
    and entering remote root with: `arch-chroot /mnt`
'



echo "### Set Date Time"
ln -sf /usr/share/zoneinfo/Europe/Lisbon /etc/localtime
hwclock --systohc



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
    gedit 
    gnome-keyring 
    go 
    gufw 
    i3status-rust 
    intel-ucode 
    keepassxc 
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
    pavucontrol 
    powerline 
    powerline-fonts 
    pulseaudio-bluetooth 
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
    xclip"


echo "### Installing all pacman packages"
sudo pacman -S $PACKAGES

