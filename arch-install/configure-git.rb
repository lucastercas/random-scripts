# Author: Lucas de Macedo
# Github: lucastercas

# Usage: ./configure-git.rb
# Ex: ./configure-git.rb

puts "=== Configuring Ruby ==="

puts "Email: "
email = $stdin.gets.chomp
system "git config --global user.email #{email}"

puts "Username: "
username = $stdin.gets.chomp
system "git config --global user.name #{username}"
