=begin
def checkAvail(a, num)
    
    if a.include?(num) == true
        puts "#{num} is in #{a}"
    else
        puts "#{num} is not in #{a}"
    end
end

arr = [1,3,5,7,9,11]
print "give me a number: "
n = gets.chomp.to_i
checkAvail(arr, n)
=end

arr = [8,1,10,31,62,64,99,91]

=begin
arr.each_with_index{ |val, idx| puts "#{idx}. #{val}"}
=end

new_arr = arr.map { |item| item+1}
puts "Original array #{arr}"
puts "New array #{new_arr}"