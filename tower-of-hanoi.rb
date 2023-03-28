# Tower of Hanoi game in Ruby

def tower_of_hanoi(num_disks, from_rod, to_rod, aux_rod)
  if num_disks == 1
    puts "Move disk 1 from #{from_rod} to #{to_rod}"
    return
  end
  
  tower_of_hanoi(num_disks-1, from_rod, aux_rod, to_rod)
  puts "Move disk #{num_disks} from #{from_rod} to #{to_rod}"
  tower_of_hanoi(num_disks-1, aux_rod, to_rod, from_rod)
end

# Main program
puts "Enter the number of disks: "
num_disks = gets.chomp.to_i

tower_of_hanoi(num_disks, "A", "C", "B")
