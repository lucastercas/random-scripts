#!/usr/bin/env ruby

# Usage: ./configure-user.rb
# Ex: ./configure-user.rb

username = ARGV[0]

#`visudo`
# Delete wheel all line
# TODO: Automate this with awk?
`useradd -m #{username} -G wheel`
`passwd`
`passwd #{username}`