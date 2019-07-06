# Usage: ./configure-mounting.rb <disk>
# Ex: ./configure-mounting.rb /dev/sda

disk = ARGV[0]

`mount #{disk}2 /mnt`

`mkdir -p /mnt/home`
`mount #{disk}4 /mnt/home`

`mkdir -p /mnt/boot`
`mkdir -p /mnt/boot/efi`
`mount #{disk}1 /mnt/boot/efi`
