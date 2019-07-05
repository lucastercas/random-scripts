#!/usr/bin/env ruby

# Usage: ./configure-mounting.rb <disk>
# Ex: ./configure-mounting.rb /dev/sda

disk = ARGV[0]

`mount #{disk}2 /mnt`

`mkdir /mnt/home`
`mount #{disk}4 /mnt/home`

`mkdir /mnt/boot/efi`
`mkdir /mnt/boot`
`mount #{disk}1 /mnt/boot/efi`