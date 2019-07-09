# Author: Lucas de Macedo
# Github: lucastercas

def get_option(question)
  puts "#{question} [Y]es / [N]o"
  option = $stdin.gets.chomp
  if option == 'Y' || option == 'y' then
    return true
  else
    return false
  end
end

puts "===== Configuring Iso ====="

get_option "Configure Keyboard?"

get_option "Configure Disk and Mounting?"

get_option "Configure Pacstrap?"

get_option "Configure Timedate?"
