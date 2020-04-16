# Arch Installation Guide

## Basic Setup

Make sure you have an internet connection.

```sh
ping 8.8.8.8
```

Now you can either use the installation script from this repository
by cloning it and executing, or simple go through each of the steps.

```sh
git clone https://github.com/jmpargana/Dotfiles
./Dotfiles/.scripts/arch-install.sh
```

1. Load keyboard layout

```sh
loadkeys de-latin1
```

2. Update system clock

```sh
timedatectl set-ntp true
```

3. Create the partitions

A good and simple layout would be:
    1. Boot - 512Mb
    2. Swap - 8Gb
    3. Root - Remaining

4. Setup the partitions

The -L flag creates a label, which will be usefull later with the booting system.

```sh
mkfs.ext4 -L p_arch /dev/nvme0n1p3
mkswap -L p_swap /dev/nvme0n1p2
mkfs.fat -F 32 -n EFIBOOT /dev/nvme0n1p1
```

5. Mount the partitions

```sh
mount -L p_arch /mnt
swapon -L p_swap
mkdir -p /mnt/boot
mount -L EFIBOOT /mnt/boot
```

6. Prepare Mirrors for Germany

```sh
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
grep -E -A 1 ".*Germany.*$" /etc/pacman.d/mirrorlist.bak | sed '/--/d' > /etc/pacman.d/mirrorlist
```

7. Install base system

```sh
pacstrap /mnt base base-devel linux linux-firmware vim
```

8. Other needed packages

```sh
pacman --root /mnt -S dhcpcd bash-completion intel-ucode wpa_supplicant netctl dialog efibootmgr dosfstools gptdisk
```

9. Generate fstab

```sh
genfstab -Up /mnt > /mnt/etc/fstab
```

10. Enter /mnt

```sh
arch-chroot /mnt/
```

11. Add hostname

```sh
echo icm > /etc/hostname
```

12. Setup language

```sh
echo LANG=en_US.UTF-8 > /etc/locale.conf
#delete line /etc/locale.gen
locale-gen
```

13. Keyboard layout

```sh
echo KEYMAP=de-latin1 > /etc/vconsole.conf
echo FONT=lat9w-16 >> /etc/vconsole.conf
```

14. Datetime

```sh
ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
hwclock --systohc
```

15. Setup hosts

```sh
echo archlinuxthinkpad > /etc/hostname
cat >> /etc/hosts <<EOF
127.0.0.1   localhost
::1         localhost
127.0.1.1   archlinuxthinkpad.localdomain   archlinuxthinkpad
EOF
```

16. Generate initramfs

```sh
mkinitcpio -p linux
```

17. Create root and user passwd

```sh
echo "Type root password:"
passwd
useradd -m -G wheel,storage,power -s /bin/bash icm
echo "Type icm password:"
passwd icm
EDITOR=vim visudo
```

18. Automatically update time

```sh
systemctl enable --now systemd-timesyncd.service
hwclock -w
```

19. Setup Bootloader

```sh
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
```

20. Exit and reboot

```sh
exit
umount -R /mnt
reboot
```


## Post Installation

After you reboot and setup the internet connection again, you can either run
the post installation script or setup the next steps one by one:

```sh
git clone https://github.com/jmpargana/Dotfiles
./Dotfiles/.scripts/arch-post-install.sh
```

1. Get AUR package manager

```sh
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

2. Setup Xorg and WMs

Install all xorg needed

```sh
sudo pacman -S xorg-server xorg-xinit xorg-drivers xterm alacritty
```

Followed by the intel video drivers

```sh
sudo pacman -S xf86-video-intel xf86-input-synaptics mesa
```

Set the keymap in xorg

```sh
localectl set-x11-keymap de pc105 nodeadkeys
```

Install additional fonts

```sh
sudo pacman -S ttf-dejavu
```

Configure sound cards.

```sh
sudo pacman -S alsa-utils
gpasswd -a icm audio
```

Prepare power interface for laptop.

```sh
sudo pacman -S acpid
sudo systemctl enable acpid
sudo systemctl start acpid
```

Finally install all packages for window managers


```sh
sudo pacman -S i3status rofi feh openbox ttf-dejavu ttf-liberation ttf-font-awesome
```


3. Setup Display Manager


```sh
sudo pacman -S lightdm
yay -S lightdm-webkit-theme-aether
sudo systemctl enable lightdm.service
```


4. Load Configs and Betterlockscreen

Get all other programs.

```sh
sudo pacman -S firefox thunderbird vlc keepassxc telegram-desktop thunar ranger
yay -S spotify
```

Install zsh or fish.

5. Basic Programming Packages

The rest should be installed either with a docker container or inside a virtual
environment for any given project.

```sh
# Python
sudo pacman -S python-pip
pip install --upgrade pip
pip install pipenv

# C++
sudo pacman -S g++ gcc make cmake clang llvm the_silver_searcher dash fzf

# JS
sudo pacman -S nodejs npm yarn

# Latex
sudo pacman -S texlive-most texlive-lang biber

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```


6. Setup Docker


```sh
sudo pacman -S docker
sudo systemctl enable docker.service
sudo systemctl start docker.service
groupadd docker
gpasswd -a icm docker
```

7. Generate SSH Key

    1. Install openssh
    ```sh
    sudo pacman -S openssh
    ```
    2. Generate key
    ```sh
    ssh-keygen -t rsa -b 4096 -C "icmjmp@protonmail.ch"
    ```
    3. Add to ssh-agent
    ```sh
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa
    ```

8. Start Firewall

9. Install VPN
