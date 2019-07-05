#!/usr/bin/env ruby

# Usage: ./configure-grub.rb
# Ex: ./configure-grub.rb

`grub-install --targer=x86_64-efi --bootloader-id=grub_uefi --recheck`
`cp /usr/share/locale/en\@quot/LC_MESSAGES/grub.mo /boot/grub/locale/en.mo`
`grub-mkconfig -o /boot/grub/grub.cfg`