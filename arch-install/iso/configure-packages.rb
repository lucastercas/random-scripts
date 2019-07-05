#!/usr/bin/env ruby

# Usage:
# Ex:
system "pacstrap -i /mnt base base-devel"
system "genfstab -U -p /mnt >> /mnt/etc/fstab"
system "arch-chroot /mnt"