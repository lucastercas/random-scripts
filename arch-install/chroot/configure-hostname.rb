#!/usr/bin/env ruby

# Usage: ./configure-hostname.rb <hostname
# Ex: ./configure-hostname hyperion

hostname = ARGV[0]
`echo #{hostname} >> /etc/hostname`
