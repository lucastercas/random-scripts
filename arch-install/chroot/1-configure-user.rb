# Usage: ./configure-user.rb
# Ex: ./configure-user.rb

username = ARGV[0]

#"visudo"
# Delete wheel all line
# TODO: Automate this with awk?
system("useradd -m #{username} -G wheel")
system("passwd")
system("passwd #{username}")
