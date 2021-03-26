#!/bin/bash

: '
    Arch Linux Install Script: Part 1

    Author: jmpargana aka icm
    Email: jmpargana@gmail.com

    Should be run after creating the following partitions:
        - 512Mb /dev/nvme0n1p1
        - 8Gb   /dev/nvme0n1p2
        - Rest  /dev/nvme0n1p3
'

echo "### Format partitions"
mkfs.ext4 -L p_arch /dev/nvme0n1p3
mkswap -L p_swap /dev/nvme0n1p2
mkfs.fat -F 32 -n EFIBOOT /dev/nvme0n1p1


echo "### Mount partitions"
mount -L p_arch /mnt
swapon -L p_swap
mkdir -p /mnt/boot
mount -L EFIBOOT /mnt/boot


echo "### Set time"
timedatectl set-ntp true


echo "### Install Arch"
pacstrap /mnt base base-devel linux linux-firmware



echo "### Generate fstab"
genfstab -Up /mnt >> /mnt/etc/fstab
