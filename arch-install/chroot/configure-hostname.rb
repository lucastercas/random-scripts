#!/usr/bin/env ruby

# Usage: ./configure-hostname.rb
# Ex: ./configure-

hostname = ARGV[0]
`echo #{hostname} >> /etc/hostname`
