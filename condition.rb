#irb -r ./the_name_of_your_file.rb
=begin
s = gets.chomp

if s.length > 10 
    puts s.upcase
else
    puts s
end
=end

=begin
print "Input a positive number: "
num = gets.chomp.to_i

if num < 0
    puts "Cannot input a negative number"
elsif num >= 0 && num <= 50
    puts "This number is between 0 and 50"
elsif num >= 51 && num <= 100
    puts "This number is between 51 and 100"
else 
    puts "This number is above 100"
end
=end

=begin
def equal_to_four(x)
    if x == 4
      puts "yup"
    else
      puts "nope"
    end
end
  
equal_to_four(5)
=end

=begin
x = 0

while x <= 10
  if x == 3
    x += 1
    next
  elsif x.odd?
    puts x
  end
  x += 1
end
=end

action = gets.chomp

while action != "STOP" do
    puts action
    action = gets.chomp
end
