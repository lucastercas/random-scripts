#!/usr/bin/env ruby

# Author: Lucas de Macedo
# Github: lucastercas
# This script automates most of the boring stuff in installing arch,
# taking care of the part after the chroot.
# Disclaimer: This script is for personal use only, and there are steps that
# are private sensitive that are not here, so do not blame me if you use it.



def configure_encryption()
end

def configure_mounting(partition)
  system "mount #{partition}/2 /mnt"

  system "mkdir /mnt/home"
  system "mount #{partition}/4 /mnt/home"

  system "mkdir /mnt/boot"
  system "mkdir /mnt/boot/efi"
  system "mount #{partition}/1 /mnt/boot/efi"
end

def configure_packages()
  system "pacstrap -i /mnt base base-devel"
  system "genfstab -U -p /mnt >> /mnt/etc/fstab"
  system "arch-chroot /mnt"
end

