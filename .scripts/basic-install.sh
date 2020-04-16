#!/bin/bash


# Load keyboard
loadkeys de-latin1

# Create partitions
sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << EOF | fdisk ${TGTDEV}
  o # clear the in memory partition table
  n # new partition
  p # primary partition
  1 # partition number 1
    # default - start at beginning of disk 
  +512M # 512 MB boot parttion
  n # new partition
  p # primary partition
  2 # partion number 2
    # default, start immediately after preceding partition
  +8G # 8 GB swap parttion
  n # new partition
  p # primary partition
  3 # partion number 3
    # default, start immediately after preceding partition
    # default, extend partition to end of disk
  a # make a partition bootable
  1 # bootable partition is partition 1 -- /dev/sda1
  p # print the in-memory partition table
  w # write the partition table
  q # and we're done
EOF


# Format the partitions
mkfs.ext4 -L p_arch /dev/nvme0n1p3
mkswap -L p_swap /dev/nvme0n1p2
mkfs.fat -F 32 -n EFIBOOT /dev/nvme0n1p1


# Mount the partitions
mount -L p_arch /mnt
swapon -L p_swap
mkdir -p /mnt/boot
mount -L EFIBOOT /mnt/boot


# Setup time
timedatectl set-ntp true

# Prepare mirrors for Germany
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
grep -E -A 1 ".*Germany.*$" /etc/pacman.d/mirrorlist.bak | sed '/--/d' > /etc/pacman.d/mirrorlist


# Install Arch and all needed packages for basic install
pacstrap /mnt base base-devel linux linux-firmware vim zsh fish intel-ucode efibootmgr
wpa_supplicant dialog networkmanager nm-connection-editor network-manager-applet bash-completion dhcpcd efibootmgr dosfstools gptdisk

# Generate fstab
genfstab -Up /mnt >> /mnt/etc/fstab

# Keyboard input
echo KEYMAP=de-latin1 > /etc/vconsole.conf
echo FONT=lat9w-16 >> /etc/vconsole.conf


# Set date time
ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
hwlock --systohc

# Set locale
sed -i '/en_US.UTF-8 UTF-8/s/^#//g' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf

# Set hostname
echo archlinuxthinkpad > /etc/hostname
cat >> /etc/hosts <<EOF
127.0.0.1   localhost
::1         localhost
127.0.1.1   archlinuxthinkpad.localdomain   archlinuxthinkpad
EOF

# Generate initramfs
mkinitcpio -P

# Set root password
echo "Set root password"
passwd

# Create new user
useradd -m -G wheel,power,storage -s /bin/bash icm
sed --in-place 's/^#\s*\(%wheel\s\+ALL=(ALL)\s\+NOPASSWD:\s\+ALL\)/\1/' /etc/sudoers
echo "Set password for icm"
passwd icm
EDITOR=vim visudo

# Automatically update time
systemctl enable --now systemd-timesyncd.service
hwclock -w


# Setup Bootloader
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



# Enable network manager for after installation
systemctl enable NetworkManager.service


# Exit and reboot
exit
umount -R /mnt
reboot

