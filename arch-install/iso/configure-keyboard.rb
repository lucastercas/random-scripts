#!/usr/bin/env ruby
# Author: Lucas de Macedo
# Github: lucastercas

# Usage: ./configure-keyboard.rb
# Ex: ./configure-keyboard.rb

puts "===== Configuring Keyboard ====="
puts "Layout of the keyboard: (ex: br-abnt2)"
layout = gets.chomp

puts "Configuring keys to #{layout}"
puts "loadkeys #{layout}"
