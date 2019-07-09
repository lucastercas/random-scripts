# Usage: ./configure-disk.rb <disk>
# Ex: ./configure-disk.rb /dev/sda

def clear_disk(disk)
  puts("Clearing disk #{disk}")
  system("sgdisk -oZg #{disk}")
end

def get_partition(disk)
  partition = {
    num: "",
    name: "",
    start: "",
    end: "",
    code: ""
  }

  puts "Name of partition: "
  partition.name = $stdin.gets.chomp

  puts "Size of partition: "
  puts "+XXGib +YYMiB"
  partition.start = $stdin.gets.chomp

  puts "Code of partition: "
  puts "efi -> ef00\nroot->8300\nswap->8200\nlinux->8302"
  partition.code = $stdin.gets.chomp

  return partition
end

def format_partition(disk, partition)
  puts "Formatting EFI"
  system("mkfs.vfat -F32 #{disk}1")

  puts "Formating ROOT"
  system("mkfs.ext4 #{disk}2")

  puts "Formating SWAP"
  system("mkswap #{disk}3")
  system("swapon #{disk}3")

  puts "Formating HOME"
  system("mkfs.ext4 #{disk}4")
end

def create_partition(disk, partition)
    puts("Creating partition #{name} - Size: #{_end}")
    system("sgdisk -n #{partition.num}:#{partition.start}:#{partition.end} -c #{partition.num}:\"#{partition.name}\" -t #{partition.num}:#{partition.code} #{partition.disk}")
end

def configure_disk(disk)

  partitions = []

  while true do
    new_partition = get_partition()
    partition.push(new_partition)
  end

  partitions.each do |part|
    create_partition(part)
  end

end

puts "Disk: "
disk = $stdin.gets.chomp
configure_disk(disk)
