#!/usr/bin/env ruby

# Usage: ./configure-location.rb <location>
# Ex: ./configure-location.rb pt_BR.UTF-8

location = ARGV[0]

`ln -sf /usr/share/zoneinfo/America/Fortaleza /etc/localtime`
`sed -i 's/#{location}/#{location}/' /etc/locale.gen`
`locale-gen`
`hwclock --systohc`
`echo "LANG=#{location}" >> /etc/locale.conf`
#`echo "KEYMAP=" >> /etc/vconsole.conf`