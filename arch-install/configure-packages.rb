# Author: Lucas de Macedo
# Github: lucastercas
# This script automates most of the boring stuff in installing arch,
# taking care of the part after the chroot.
# Disclaimer: This script is for personal use only, and there are steps that
# are private sensitive that are not here, so do not blame me if you use it.
#
def defaultPackages()
  puts('Installing Arch Packages')
  default_packages_file = File.open("default-packages.txt")
  default_packages = []
  default_packages_file.each_line do |line|
    if line[0] != '#' then
      default_packages.append(line.gsub("\n", ''))
    end
  end
  default_packages = default_packages.join(' ')
  system("sudo pacman -S #{default_packages}")
end

def aurPackages()
  puts('Installing AUR Packages')
  aur_packages_file = File.open('aur-packages.txt')
  aur_packages = []
  aur_packages_file.each_line do |line|
    if line[0] != '#' then
      aur_packages.append(line.gsub("\n", ''))
    end
  end
  aur_packages = aur_packages.join(' ')
  system("yay -S #{aur_packages}")
end

aurPackages()
