def fibs(num)

    i = 0
    fib_arr = []

    while i < num
        if i < 2
            fib_arr.push(i)
            print "#{i} "
        else
            temp = fib_arr[i-1] + fib_arr[i-2]
            fib_arr.push(temp)
            print "#{temp} "
        end
        i += 1
    end

    puts "\n"
end

def fibs_rec(number)
    if number < 2
      number
    else
      fibs_rec(number - 1) + fibs_rec(number - 2)
    end
end
  
print "Enter the a number: "
num = gets.chomp.to_i()
fibs(num)

for i in (0..num-1)
    print "#{fibs_rec(i)} "
end
puts "\n"