#!/usr/bin/env ruby

# Author: Lucas de Macedo
# Github: lucasmtercas
# This script automates most of the boring stuff in installing arch,
# taking care of the part after the chroot.
# Disclaimer: This script is for personal use only, and there are steps that
# are private sensitive that are not here, so do not blame me if you use it.

#system "passwd"
#load "arch/install.rb"

def configure_location(location)
  `sed -i 's/#{location}/#{location}/' /etc/locale.gen`
  `locale-gen`
  `hwclock --systohc`
  `echo "LANG=#{location}" >> /etc/locale.conf`
  #`echo "KEYMAP=" >> /etc/vconsole.conf`
end

def configure_hostname(hostname)
  `echo #{hostname} >> /etc/hostname`
end

def configure_grub()
  `grub-install --targer=x86_64-efi --bootloader-id=grub_uefi --recheck`
  `cp /usr/share/locale/en\@quot/LC_MESSAGES/grub.mo /boot/grub/locale/en.mo`
  `grub-mkconfig -o /boot/grub/grub.cfg`
end

def configure_user(username)
  `visudo`
  `useradd -m #{username} -G wheel`
end

location = "pt_BR.UTF-8"
hostname = ""
