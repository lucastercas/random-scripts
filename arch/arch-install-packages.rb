#!/usr/bin/env ruby

# Author: Lucas de Macedo
# Github: lucasmtercas
# This script automates most of the boring stuff in installing arch,
# taking care of the part after the chroot.
# Disclaimer: This script is for personal use only, and there are steps that
# are private sensitive that are not here, so do not blame me if you use it.
#
puts('Installing Arch Packages')
default_packages_file = File.open("arch/default-packages.txt")

default_packages = []
default_packages_file.each_line do |line|
  if line[0] != '#' then
    default_packages.append(line.gsub("\n", ''))
  end
end
default_packages = default_packages.join(' ')

system("sudo pacman -S #{default_packages}")
