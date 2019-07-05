#!/usr/bin/env ruby

# Usage: ./configure-disk.rb <disk>
# Ex: ./configure-disk.rb /dev/sda

disk = ARGV[0]
clear_disk(disk)
configure_disk(disk)

def clear_disk(disk)
  puts("Clearing disk #{disk}")
  `sgdisk -oZg #{disk}`
end

def configure_disk(disk)
  puts "Size of EFI (mb):"
  efi_size = gets

  puts "Size of ROOT (gb):"
  root_size = gets

  puts "Size of SWAP (gb):"
  swap_size = gets

  partitions = [ 
    [1, 'efi', 'ef00', "+#{efi_size.chomp}MiB"],
    [2, 'root', '8300', "+#{root_size.chomp}Gib"],
    [3, 'swap', '8200', "+#{swap_size.chomp}GiB"],
    [4, 'home', '8302', '0']
  ]

  partitions.each do |part|
    create_partition(disk, part[0], "0", part[3], part[1], part[2])
  end

  puts "Formatting EFI"
  `mkfs.fat32 -F32 #{disk}1`

  puts "Formating ROOT"
  `mkfs.ext4 #{disk}2`

  puts "Formating SWAP"
  `mkswap #{disk}3`
  `swapon #{disk}3`

  puts "Formating HOME"
  `mkfs ext4 #{disk}4`
end

def create_partition(disk, num, start, _end, name, type)
    puts("Creating partition #{name} - Size: #{_end}")
    `sgdisk -n #{num}:#{start}:#{_end} -c #{num}:\"#{name}\" -t #{num}:#{type} #{disk}`
end