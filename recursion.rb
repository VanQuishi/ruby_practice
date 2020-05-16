=begin
def fibonacci(number)
    if number < 2
      number
    else
      fibonacci(number - 1) + fibonacci(number - 2)
    end
end
  
puts fibonacci(6)
=end

print "Give me a positive number: "

num = gets.chomp.to_i

def countDown(n)
    puts n
    if n > 0
        countDown(n-1)
    end
end

countDown(num)

