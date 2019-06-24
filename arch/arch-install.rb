#!/usr/bin/env ruby

# Author: Lucas de Macedo
# Github: lucasmtercas
# This script automates most of the boring stuff in installing arch,
# taking care of the part after the chroot.
# Disclaimer: This script is for personal use only, and there are steps that
# are private sensitive that are not here, so do not blame me if you use it.

def configure_keyboard()
  key_layout = "br-abnt2"
  puts "Configure keys to #{key-layout}"
  system "loadkeys #{key_layout}"
end

def configure_network()
  system "ping -c 3 google.com"
  system "wifi-menu"
  #"ip addr show"
end

def configure_time()
  system "timedatectl set-ntp true"
end

def clear_partition(partition)
  puts "sgdisk -oZg #{partition}"
end

def create_partition(partition, num, start, _end, name, type)
  puts "sgdisk -n #{num}:#{start}:#{_end} -c #{num}:\"#{name}\" -t #{num}:#{type} -p #{partition}"
end

def configure_disk(partition)
  partitions = [
    [1, 'efi', 'ef00', '+512MiB'],
    [2, 'root', '8300', '+30Gib'],
    [3, 'swap', '8200', '+4GiB'],
    [4, 'home', '8302', '0']
  ]

  partitions.each do |part|
    create_partition(partition, part[0], "0", part[3], part[1], part[2])
  end
end

def format_partitions(partition)
  system "mkfs.fat32 -F32 #{partition}/1"
  system "mkfs.ext4 #{partition}/2"
  system "mkfs.ext4 #{partition}/4"

  system "mkswap #{partition}/3"
  system "swapon #{partition}/3"
end

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

puts "Partitions: "
system "fdisk -l"
