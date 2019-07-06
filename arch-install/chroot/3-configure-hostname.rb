# Usage: ./configure-hostname.rb <hostname
# Ex: ./configure-hostname hyperion

hostname = ARGV[0]
system("echo #{hostname} >> /etc/hostname")
