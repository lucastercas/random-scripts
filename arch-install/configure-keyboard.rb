#!/usr/bin/env ruby

# Usage: ./configure-keyboard.rb <layout>
# Ex: ./configure-keyboard.rb br-abnt2
layout = ARGV[0]

puts "Configure keys to #{layout}"
system "loadkeys #{layout}"