#!/bin/bash

# Check if the script is being run as root
sudo su

# Create a partition on sda
echo -e "n\np\n3\n\n\nw" | fdisk /dev/sda

# Format the new partition
mkfs.ext4 /dev/sda3

# Create a mount point for the new partition
mkdir /mnt/sda3

# Mount the new partition
mount /dev/sda3 /mnt/sda3

# Move the contents of the current /var directory to the new partition
rsync -av /var/* /mnt/sda3/

# Unmount the current /var directory
umount /var

# Mount the new partition to /var
mount /dev/sda3 /var

# Update /etc/fstab to make the new partition mount on boot
echo "/dev/sda3  /var  ext4  defaults  0  2" >>/etc/fstab

# Reboot to ensure that everything is working properly
reboot
